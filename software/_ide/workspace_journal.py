# 2026-06-07T00:05:07.729923200
import vitis

client = vitis.create_client()
client.set_workspace(path="software")

platform = client.get_component(name="PCIE_FRA")
status = platform.build()

vitis.dispose()

