# Tutorial: Creating Snapshots of Azure Disks

Snapshots capture the state of a disk at a point in time, making them invaluable for backups and disaster recovery.

---

## **Step 1: Create a Snapshot**

### **Azure Portal**
1. Go to **Disks** > Select the Disk > **Create Snapshot**.
2. Provide a snapshot name and specify a resource group.
3. Select the snapshot type: **Full** (entire disk) or **Incremental** (changes since last snapshot).
4. Click **Create**.

### **Azure CLI**
```bash
az snapshot create \
  --resource-group MyResourceGroup \
  --source MyDisk \
  --name MySnapshot
```

### **PowerShell**
```powershell
New-AzSnapshot -ResourceGroupName "MyResourceGroup" -SnapshotName "MySnapshot" -DiskName "MyDisk"
```

---

## **Step 2: Restore from Snapshot**

### **Portal Steps**
1. Navigate to **Snapshots**.
2. Select the snapshot > **Create Disk**.
3. Attach the disk to a VM as described in [Attaching Disks to VMs](Attaching_Disks_to_VMs.md).

### **CLI**
```bash
az disk create \
  --resource-group MyResourceGroup \
  --name RestoredDisk \
  --source MySnapshot
```

For details, visit [Azure Snapshots Documentation](https://learn.microsoft.com/en-us/azure/virtual-machines/disks-snapshots).



