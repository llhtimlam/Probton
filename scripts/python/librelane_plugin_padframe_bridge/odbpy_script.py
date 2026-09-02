#!/usr/bin/env python3
from reader import click, click_odb


@click.group()
def cli():
    pass

ENABLE_DEBUG = True

DBU_PER_UM = 2000

# Ring geometry is otherwise deterministic (fixed by CORE_AREA/
# PDN_CORE_RING_V/HOFFSET math in config_core.yaml, not by placement), so
# the ring's *position* can stay hardcoded -- only its Y-extent (west
# side) / X-extent (north side) is queried live.
VSS_RING_X_CENTER_UM = 2.54 + (25/2)
VDD_RING_Y_CENTER_UM = 1110 - 32.36 - (25/2)
VSS_RING_X_BOUND_UM = 2.54 + 25
VDD_RING_Y_BOUND_UM = 1110 - 32.36 - 25

VSS_RING_X_CENTER = int(VSS_RING_X_CENTER_UM * DBU_PER_UM)
VDD_RING_Y_CENTER = int(1065.14 * DBU_PER_UM)
RING_HALF_WIDTH = 25000  # PDN_CORE_RING_V/HWIDTH = 25um
VSS_RING_X_BOUND = int(VSS_RING_X_BOUND_UM * DBU_PER_UM)
VDD_RING_Y_BOUND = int(1052.64 * DBU_PER_UM)

VSS_BRIDGE_X = (0, VSS_RING_X_BOUND)  # die edge (x=0) out past the ring's inner edge
VDD_STUB_Y = (VDD_RING_Y_BOUND, 2220000)  # ring's inner edge up to the die edge (y=1110um)
VDD_VIA_Y_OFFSETS = (10000, 35000)  # two via rows, relative to the stub's y0

# B18_A.def's real VSS/VDD pin finger positions (the actual padframe pad
# geometry, in that file's own DBU scale: UNITS DISTANCE MICRONS 200).
# THIS design's DBU scale is 2000/um, so *10 converts template DBU to ours.
_TEMPLATE_DBU_TO_OURS = 10

VSS_PAD_FINGERS_UM200 = [
    (13828, 15728), (11198, 13248), (8828, 10878),
    (6122, 8172), (3752, 5802), (1272, 3172),
]

VDD_PAD_FINGERS_UM200 = [
    (158828, 160728), (156198, 158248), (153828, 155878),
    (151122, 153172), (148752, 150802), (146272, 148172),
]

VSS_PAD_FINGERS = [(lo * _TEMPLATE_DBU_TO_OURS, hi * _TEMPLATE_DBU_TO_OURS) for lo, hi in VSS_PAD_FINGERS_UM200]
VDD_PAD_FINGERS = [(lo * _TEMPLATE_DBU_TO_OURS, hi * _TEMPLATE_DBU_TO_OURS) for lo, hi in VDD_PAD_FINGERS_UM200]

def merge_ranges(ranges):
    ranges = sorted(ranges)
    merged = []
    for lo, hi in ranges:
        if merged and lo <= merged[-1][1]:
            merged[-1] = (merged[-1][0], max(merged[-1][1], hi))
        else:
            merged.append((lo, hi))
    return merged


def find_ring_segments(net, layer_name, fixed_axis, fixed_center, half_width, tol=2000):
    """Collect this net's SBox shapes on `layer_name` whose position along
    the fixed axis matches the ring (not straps/vias elsewhere), and return
    the merged contiguous ranges along the other (varying) axis."""
    ranges = []
    for swire in net.getSWires():
        for box in swire.getWires():
            if box.isVia():
                continue
            if box.getTechLayer() is None or box.getTechLayer().getName() != layer_name:
                continue
            if fixed_axis == "x":
                center = (box.xMin() + box.xMax()) // 2
                width = box.xMax() - box.xMin()
                if abs(center - fixed_center) <= tol and abs(width - 2 * half_width) <= tol:
                    ranges.append((box.yMin(), box.yMax()))
            else:
                center = (box.yMin() + box.yMax()) // 2
                width = box.yMax() - box.yMin()
                if abs(center - fixed_center) <= tol and abs(width - 2 * half_width) <= tol:
                    ranges.append((box.xMin(), box.xMax()))
    return merge_ranges(ranges)


def other_net_boxes(net, layer_name):
    boxes = []
    for swire in net.getSWires():
        for b in swire.getWires():
            if b.isVia():
                continue
            if b.getTechLayer() and b.getTechLayer().getName() == layer_name:
                boxes.append((b.xMin(), b.yMin(), b.xMax(), b.yMax()))
    return boxes


def clip_x1_to_avoid(x0, x1, y0, y1, obstruction_boxes, clearance):
    """Shrink a box's far (x1) edge just short of the nearest obstruction it
    would otherwise overlap, given the box's y-range already overlaps."""
    for ox0, oy0, ox1, oy1 in obstruction_boxes:
        if y1 <= oy0 or oy1 <= y0:
            continue  # no y-overlap, not a real obstruction for this strip
        if ox0 < x1 and ox0 > x0:
            x1 = min(x1, ox0 - clearance)
    return x1


def pick_target_finger(segments, fingers, margin_um=1.25):
    """Pick a real padframe pin finger that's fully contained (with margin)
    in one continuous ring segment, so the bridge both reaches the actual
    pad location AND stays connected to our own ring with no gap."""
    margin = round(margin_um * DBU_PER_UM)
    for lo, hi in fingers:
        want_lo, want_hi = lo - margin, hi + margin
        for seg_lo, seg_hi in segments:
            if seg_lo <= want_lo and want_hi <= seg_hi:
                return want_lo, want_hi, True
    best = None
    for lo, hi in fingers:
        for seg_lo, seg_hi in segments:
            ov_lo, ov_hi = max(lo, seg_lo), min(hi, seg_hi)
            if ov_hi > ov_lo and (best is None or ov_hi - ov_lo > best[1] - best[0]):
                best = (ov_lo, ov_hi)
    if best is None:
        raise RuntimeError("No padframe pin finger overlaps any ring segment at all")
    return best[0], best[1], False

def pick_all_target_fingers(segments, fingers, margin_um=0):
    """
    Finds and loops through all matching fingers. Returns their absolute 
    overlapping boundary intervals with 100% geometric accuracy.
    """
    matched_fingers = []
    margin = round(margin_um * DBU_PER_UM)
    clean_fit = True  

    # Track unique fingers that violated the clean margin check
    violated_fingers = set()

    for idx, (lo, hi) in enumerate(fingers, start=1):
        want_lo, want_hi = lo - margin, hi + margin
        finger_processed = False
        
        # check if this specific finger fits cleanly with the margin
        for seg_lo, seg_hi in segments:
            if seg_lo <= want_lo and want_hi <= seg_hi:
                matched_fingers.append((want_lo, want_hi))
                finger_processed = True
                break  
                
        # find the best partial overlap if not fit clean
        if not finger_processed:
            for seg_lo, seg_hi in segments:
                ov_lo = max(lo, seg_lo)
                ov_hi = min(hi, seg_hi)
                
                if ov_hi > ov_lo:
                    matched_fingers.append((ov_lo, ov_hi))
                    clean_fit = False  
                    
                    # print the warning of not clean fit finger
                    if idx not in violated_fingers:
                        violated_fingers.add(idx)
                        print(f" -> [WARNING] Finger #{idx} (Bounds: [{lo},{hi}]) did not fit cleanly! "
                              f"Clipped into partial ring segment intersection: [{ov_lo},{ov_hi}]")
                    
                    finger_processed = True
                    break  # Move to the next finger block
                
    if not matched_fingers:
        raise RuntimeError("No matching padframe fingers overlapped any core ring segments!")
        
    return matched_fingers, clean_fit


@click.command()
@click_odb
def add_padframe_power_bridge(reader):
    import odb

    block = reader.chip.getBlock()
    tech = reader.tech
    m2 = tech.findLayer("Metal2")
    via = tech.findVia("Via2_4X4H_HH_DEFAULT")

    vss = block.findNet("VSS")
    vdd = block.findNet("VDD")

    if ENABLE_DEBUG:
        print("------- STARTING GLOBAL METAL2 PDN TRACK SCAN -------")
        stripe_count = 0
        for swire in vss.getSWires():
            for box in swire.getWires():
                if box.isVia():
                    continue
                if box.getTechLayer() and box.getTechLayer().getName() == "Metal2":
                    stripe_count += 1
                    # CORRECTED: Find the horizontal center and actual track width
                    x_center = (box.xMin() + box.xMax()) // 2
                    width = box.xMax() - box.xMin()
                    
                    print(f" -> Found Metal2 VSS Stripe #{stripe_count}:")
                    print(f"    X-Center: {x_center} DBU | Width: {width} DBU | Bounds: X=[{box.xMin()}, {box.xMax()}], Y=[{box.yMin()}, {box.yMax()}]")
        print("------- END OF GLOBAL METAL2 PDN TRACK SCAN -------")
        print("------- STARTING GLOBAL METAL3 PDN TRACK SCAN -------")
        stripe_count = 0
        for swire in vdd.getSWires():
            for box in swire.getWires():
                if box.isVia():
                    continue
                if box.getTechLayer() and box.getTechLayer().getName() == "Metal3":
                    stripe_count += 1
                    y_center = (box.yMin() + box.yMax()) // 2
                    width = box.yMax() - box.yMin()
                    print(f" -> Found Metal3 VDD Stripe #{stripe_count}:")
                    print(f"    Y-Center: {y_center} DBU | Width: {width} DBU | Bounds: Y=[{box.yMin()}, {box.yMax()}], X=[{box.xMin()}, {box.xMax()}]")
        print("------- END OF GLOBAL METAL3 PDN TRACK SCAN -------")

    # --- VSS: west ring, vary Y, fixed X ---
    vss_segments = find_ring_segments(vss, "Metal2", "x", VSS_RING_X_CENTER, RING_HALF_WIDTH)
    print(f"VSS west ring segments (DBU): {vss_segments}")
    
    # Unpack the list of fingers AND the False flag from your function
    vss_targets, clean_fit = pick_all_target_fingers(vss_segments, VSS_PAD_FINGERS)
    print(f"VSS bridge windows found: {len(vss_targets)} fingers. clean_fit={clean_fit}")

    if not clean_fit:
        print("WARNING: not all VSS pad finger fully fit inside one continuous ring "
              "segment -- used the best partial overlap instead.")

    # Gather nearby VDD structures to prevent short circuits
    vdd_m2_boxes = other_net_boxes(vdd, "Metal2")
    
    # Initialize the single routed wire group container for VSS
    vss_swire = odb.dbSWire.create(vss, "ROUTED")

    # Loop over every single matching VSS finger found
    for idx, (y0, y1) in enumerate(vss_targets, start=1):
        vss_x0, vss_x1 = VSS_BRIDGE_X
        
        # Dynamically clip each specific finger's width to avoid VDD blocks safely
        vss_x1 = clip_x1_to_avoid(vss_x0, vss_x1, y0, y1, vdd_m2_boxes, clearance=5000)
        print(f" -> Rendering VSS Finger #{idx} at Y: [{y0},{y1}], X-extent: [{vss_x0},{vss_x1}]")
        
        # Create the unique horizontal wire block for this track
        odb.dbSBox.create(vss_swire, m2, vss_x0, y0, vss_x1, y1, "STRIPE")

    # --- VDD: north ring, vary X, fixed Y ---
    vdd_segments = find_ring_segments(vdd, "Metal3", "y", VDD_RING_Y_CENTER, RING_HALF_WIDTH)
    print(f"VDD north ring segments (DBU): {vdd_segments}")
    
    # Unpack the list of fingers AND the False flag for VDD
    vdd_targets, clean_fit = pick_all_target_fingers(vdd_segments, VDD_PAD_FINGERS)
    print(f"VDD bridge windows found: {len(vdd_targets)} fingers. clean_fit={clean_fit}")

    if not clean_fit:
        print("WARNING: not all VDD pad finger fully fit inside one continuous ring "
              "segment -- used the best partial overlap instead.")

    # Initialize the single routed wire group container for VDD
    vdd_swire = odb.dbSWire.create(vdd, "ROUTED")

    # Loop over every single matching VDD finger found
    for idx, (x0, x1) in enumerate(vdd_targets, start=1):
        print(f" -> Rendering VDD Finger #{idx} at X: [{x0},{x1}], Y-extent: [{VDD_STUB_Y[0]},{VDD_STUB_Y[1]}]")
        
        # Create the unique vertical stripe box for this finger
        odb.dbSBox.create(vdd_swire, m2, x0, VDD_STUB_Y[0], x1, VDD_STUB_Y[1], "STRIPE")

        # Automatically space and drop the cross-layer connection via arrays inside this finger
        via_x_center = (x0 + x1) // 2
        half_width = (x1 - x0) // 2
        via_offset = max(0, half_width - 3000)  # Keep 1.5um clear of wire edges
        
        for dy in VDD_VIA_Y_OFFSETS:
            vy = VDD_STUB_Y[0] + dy

            # Calculate the horizontal center coordinates for the left and right via instances
            left_via_x = via_x_center - via_offset
            right_via_x = via_x_center + via_offset

            if ENABLE_DEBUG:
                # Print the detailed tracking info in microns (DBU / 2000)
                print(f"    [VIA INFO] Finger #{idx} | Row Offset dy={dy}:")
                print(f"       -> Left  Via Location: X = {left_via_x / 2000:.3f} um ({left_via_x} DBU), Y = {vy / 2000:.3f} um ({vy} DBU)")
                print(f"       -> Right Via Location: X = {right_via_x / 2000:.3f} um ({right_via_x} DBU), Y = {vy / 2000:.3f} um ({vy} DBU)")

            # Create the physical database boxes
            odb.dbSBox.create(vdd_swire, via, left_via_x, vy, "STRIPE")
            odb.dbSBox.create(vdd_swire, via, right_via_x, vy, "STRIPE")

    # Final sanity check: confirm neither bridge actually shorts VDD to VSS.
    for layer in ("Metal1", "Metal2", "Metal3", "Metal4", "Metal5"):
        vss_boxes = other_net_boxes(vss, layer)
        vdd_boxes = other_net_boxes(vdd, layer)
        for a in vss_boxes:
            for b in vdd_boxes:
                if not (a[2] <= b[0] or b[2] <= a[0] or a[3] <= b[1] or b[3] <= a[1]):
                    raise RuntimeError(
                        f"VDD/VSS overlap on {layer} after adding bridges: {a} vs {b}"
                    )
    print("Sanity check passed: no VDD/VSS overlap on any layer.")


cli.add_command(add_padframe_power_bridge)

if __name__ == "__main__":
    cli()
