from azure.identity import DefaultAzureCredential
from azure.mgmt.compute import ComputeManagementClient

# Authentication
credential = DefaultAzureCredential()
compute_client = ComputeManagementClient(credential, subscription_id="your_subscription_id")

# Attach a managed disk to an existing VM
vm_name = "myVM"
resource_group = "myResourceGroup"
disk_id = "/subscriptions/<subscription_id>/resourceGroups/myResourceGroup/providers/Microsoft.Compute/disks/example-disk"

vm = compute_client.virtual_machines.get(resource_group, vm_name)
vm.storage_profile.data_disks.append({
    "lun": 0,
    "name": "example-disk",
    "create_option": "Attach",
    "managed_disk": {"id": disk_id}
})

compute_client.virtual_machines.begin_create_or_update(resource_group, vm_name, vm)
print(f"Disk attached to VM: {vm_name}")
