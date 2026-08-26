#!/usr/bin/env python3
from reader import click, click_odb


@click.group()
def cli():
    pass


DBU_PER_UM = 2000

# Ring geometry is otherwise deterministic (fixed by CORE_AREA/
# PDN_CORE_RING_V/HOFFSET math in config_core.yaml, not by placement), so
# the ring's *position* can stay hardcoded -- only its Y-extent (west
# side) / X-extent (north side) is queried live.
VSS_RING_X_CENTER = 110080
VDD_RING_Y_CENTER = 2051880
RING_HALF_WIDTH = 25000  # PDN_CORE_RING_V/HWIDTH = 25um

VSS_BRIDGE_X = (0, 144000)  # die edge (x=0) out past the ring's inner edge
VDD_STUB_Y = (2030000, 2220000)  # ring's inner edge up to the die edge (y=1110um)
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


def pick_target_finger(segments, fingers, margin_um=3):
    """Pick a real padframe pin finger that's fully contained (with margin)
    in one continuous ring segment, so the bridge both reaches the actual
    pad location AND stays connected to our own ring with no gap."""
    margin = margin_um * DBU_PER_UM
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

    # --- VSS: west ring, vary Y, fixed X ---
    vss_segments = find_ring_segments(vss, "Metal2", "x", VSS_RING_X_CENTER, RING_HALF_WIDTH)
    print(f"VSS west ring segments (DBU): {vss_segments}")
    y0, y1, clean_fit = pick_target_finger(vss_segments, VSS_PAD_FINGERS)
    print(f"VSS bridge window (on a real pad finger): y=[{y0},{y1}] clean_fit={clean_fit}")
    if not clean_fit:
        print("WARNING: no VSS pad finger fully fit inside one continuous ring "
              "segment -- used the best partial overlap instead.")

    vss_x0, vss_x1 = VSS_BRIDGE_X
    vdd_m2_boxes = other_net_boxes(vdd, "Metal2")
    vss_x1 = clip_x1_to_avoid(vss_x0, vss_x1, y0, y1, vdd_m2_boxes, clearance=5000)
    print(f"VSS bridge x-extent after clipping clear of VDD's own Metal2: [{vss_x0},{vss_x1}]")

    vss_swire = odb.dbSWire.create(vss, "ROUTED")
    odb.dbSBox.create(vss_swire, m2, vss_x0, y0, vss_x1, y1, "STRIPE")

    # --- VDD: north ring, vary X, fixed Y ---
    vdd_segments = find_ring_segments(vdd, "Metal3", "y", VDD_RING_Y_CENTER, RING_HALF_WIDTH)
    print(f"VDD north ring segments (DBU): {vdd_segments}")
    x0, x1, clean_fit = pick_target_finger(vdd_segments, VDD_PAD_FINGERS)
    print(f"VDD bridge window (on a real pad finger): x=[{x0},{x1}] clean_fit={clean_fit}")
    if not clean_fit:
        print("WARNING: no VDD pad finger fully fit inside one continuous ring "
              "segment -- used the best partial overlap instead.")

    vdd_swire = odb.dbSWire.create(vdd, "ROUTED")
    odb.dbSBox.create(vdd_swire, m2, x0, VDD_STUB_Y[0], x1, VDD_STUB_Y[1], "STRIPE")

    via_x_center = (x0 + x1) // 2
    half_width = (x1 - x0) // 2
    via_offset = max(0, half_width - 3000)  # keep >=1.5um clear of the stub's own edges
    for dy in VDD_VIA_Y_OFFSETS:
        vy = VDD_STUB_Y[0] + dy
        odb.dbSBox.create(vdd_swire, via, via_x_center - via_offset, vy, "STRIPE")
        odb.dbSBox.create(vdd_swire, via, via_x_center + via_offset, vy, "STRIPE")

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
