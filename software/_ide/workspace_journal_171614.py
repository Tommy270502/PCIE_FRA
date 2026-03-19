# 2026-03-19T14:28:48.964237
import vitis

client = vitis.create_client()
client.set_workspace(path="software")

platform = client.get_component(name="fra_zynq7015_pcie")
status = platform.build()

comp = client.get_component(name="PS_system")
comp.build()

status = platform.update_hw(hw_design = "$COMPONENT_LOCATION/../../hardware/fra_zynq7015_pcie/fra_zynq7015_pcie.xsa")

status = platform.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

vitis.dispose()

