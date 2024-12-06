# Tutorial: Resizing Managed Disks in Azure

Azure allows you to resize managed disks dynamically without VM downtime.

---

## **Step 1: Resize the Disk**

### **Azure Portal**
1. Go to **Disks** > Select the Disk.
2. Click **Configuration**.
3. Update the **Size (GiB)** field.
4. Click **Save**.

### **Azure CLI**
```bash
az disk update \
  --resource-group MyResourceGroup \
  --name MyDisk \
  --size-gb 1024
```

### **PowerShell**
```powershell
Update-AzDisk -ResourceGroupName "MyResourceGroup" -DiskName "MyDisk" -DiskSizeGB 1024
```

---

## **Step 2: Resize the Partition in the OS**

### **Linux**
1. Use `lsblk` to list the attached disks.
2. Use `growpart` to extend the partition.
3. Resize the file system:
   ```bash
   sudo resize2fs /dev/sdX1
   ```

### **Windows**
1. Open Disk Management.
2. Select the disk > Right-click > **Extend Volume**.

---

For more information, visit [Azure Disk Resizing Documentation](https://learn.microsoft.com/en-us/azure/virtual-machines/disks-resize).

Let me know if you'd like any further refinements!