# 2026-03-19T18:39:35.435464500
import vitis

client = vitis.create_client()
client.set_workspace(path="software")

platform = client.get_component(name="PCIE_FRA")
status = platform.build()

comp = client.get_component(name="FRA_Controller")
comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = comp.clean()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

