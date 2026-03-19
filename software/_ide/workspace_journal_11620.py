# 2026-03-19T14:53:21.178594
import vitis

client = vitis.create_client()
client.set_workspace(path="software")

platform = client.get_component(name="fra_zynq7015_pcie")
status = platform.build()

comp = client.get_component(name="PS_system")
comp.build()

client.delete_component(name="fra_zynq7015_pcie")

client.delete_component(name="PS_system")

advanced_options = client.create_advanced_options_dict(dt_overlay="0")

platform = client.create_platform_component(name = "pcie_fra",hw_design = "$COMPONENT_LOCATION/../../hardware/fra_zynq7015_pcie/fra_zynq7015_pcie.xsa",os = "standalone",cpu = "ps7_cortexa9_0",domain_name = "standalone_ps7_cortexa9_0",generate_dtb = False,advanced_options = advanced_options,compiler = "gcc")

platform = client.get_component(name="pcie_fra")
status = platform.build()

comp = client.create_app_component(name="FRA_controller",platform = "$COMPONENT_LOCATION/../pcie_fra/export/pcie_fra/pcie_fra.xpfm",domain = "standalone_ps7_cortexa9_0")

status = platform.build()

comp = client.get_component(name="FRA_controller")
comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.update_hw(hw_design = "$COMPONENT_LOCATION/../../hardware/fra_zynq7015_pcie/pcie_fra.xsa")

status = platform.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = comp.clean()

status = platform.build()

comp.build()

client.delete_component(name="FRA_controller")

status = platform.build()

status = platform.update_hw(hw_design = "$COMPONENT_LOCATION/../../hardware/fra_zynq7015_pcie/pcie_fra.xsa")

status = platform.build()

client.delete_component(name="pcie_fra")

advanced_options = client.create_advanced_options_dict(dt_overlay="0")

platform = client.create_platform_component(name = "PCIE_FRA",hw_design = "$COMPONENT_LOCATION/../../hardware/fra_zynq7015_pcie/pcie_fra.xsa",os = "standalone",cpu = "ps7_cortexa9_0",domain_name = "standalone_ps7_cortexa9_0",generate_dtb = False,advanced_options = advanced_options,compiler = "gcc")

platform = client.get_component(name="PCIE_FRA")
status = platform.build()

comp = client.create_app_component(name="FRA_Controller",platform = "$COMPONENT_LOCATION/../PCIE_FRA/export/PCIE_FRA/PCIE_FRA.xpfm",domain = "standalone_ps7_cortexa9_0")

status = platform.build()

comp = client.get_component(name="FRA_Controller")
comp.build()

status = platform.build()

comp.build()

status = comp.clean()

status = platform.build()

comp.build()

vitis.dispose()

