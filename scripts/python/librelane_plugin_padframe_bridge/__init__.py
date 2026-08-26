import os

from librelane.flows.classic import Classic
from librelane.flows.flow import Flow
from librelane.steps.odb import OdbpyStep
from librelane.steps.step import Step


@Step.factory.register()
class AddPadframePowerBridge(OdbpyStep):
    """
    Bridges the core PDN ring out to the padframe template's real VSS/VDD
    pin locations at the true die edge. See odbpy_script.py for why this
    has to run as its own step, positioned after OpenROAD.GeneratePDN
    (rather than as raw Tcl added to PDN_CFG -- tried twice, including
    after this plugin was briefly removed in favor of it): pdngen's real
    ring geometry doesn't exist yet at PDN_CFG-sourcing time, and this
    step needs to query it live to land on both a continuous ring segment
    and the padframe's actual pin location -- a hardcoded Tcl target that
    passed one clean signoff run failed the very next run when the ring's
    (non-deterministic) local split happened to land on top of it.
    """

    id = "Odb.AddPadframePowerBridge"
    name = "Add Padframe Power Bridge"

    def get_script_path(self):
        return os.path.join(os.path.dirname(__file__), "odbpy_script.py")

    def get_subcommand(self):
        return ["add-padframe-power-bridge"]


@Flow.factory.register()
class ClassicWithPadframeBridge(Classic):
    """
    The Classic flow with Odb.AddPadframePowerBridge inserted right after
    OpenROAD.GeneratePDN, so the padframe power bridge is applied
    automatically as part of the normal flow instead of a separate manual
    script step between two flow invocations.
    """

    Steps = []
    for _step in Classic.Steps:
        Steps.append(_step)
        if _step.id == "OpenROAD.GeneratePDN":
            Steps.append(AddPadframePowerBridge)
    del _step
