# 2026-03-19T13:29:26.712707
import vitis

client = vitis.create_client()
client.set_workspace(path="software")

advanced_options = client.create_advanced_options_dict(dt_overlay="0")

platform = client.create_platform_component(name = "fra_zynq7015_pcie",hw_design = "$COMPONENT_LOCATION/../../hardware/fra_zynq7015_pcie/fra_zynq7015.xsa",os = "standalone",cpu = "ps7_cortexa9_0",domain_name = "standalone_ps7_cortexa9_0",generate_dtb = False,advanced_options = advanced_options,compiler = "gcc")

platform = client.get_component(name="fra_zynq7015_pcie")
status = platform.build()

comp = client.create_app_component(name="PS_system",platform = "$COMPONENT_LOCATION/../fra_zynq7015_pcie/export/fra_zynq7015_pcie/fra_zynq7015_pcie.xpfm",domain = "standalone_ps7_cortexa9_0")

status = platform.build()

comp = client.get_component(name="PS_system")
comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

vitis.dispose()

