# Tutorial: Attaching Disks to Azure Virtual Machines (VMs)

Attaching additional disks to an Azure VM allows you to expand storage and improve data management. This tutorial walks you through the process using the Azure portal, CLI, and PowerShell.

---

## **Step 1: Prepare the Disk**
1. **Create a Managed Disk:**
   - Navigate to the [Azure Portal](https://portal.azure.com).
   - Select **Disks** > **Create a Disk**.
   - Specify the disk name, storage type, size, and region.
   - Click **Create**.

2. **Determine Disk Type:**
   | **Use Case**                     | **Recommended Disk** |
   |-----------------------------------|-----------------------|
   | General-purpose workloads         | Standard SSD         |
   | High-performance databases         | Premium SSD          |
   | Mission-critical workloads         | Ultra Disk           |

   Learn more about disk types in the [Azure Disk Documentation](https://learn.microsoft.com/en-us/azure/virtual-machines/disks-overview).

---

## **Step 2: Attach Disk to VM**

### **Azure Portal**
1. Open your VM in the portal.
2. Navigate to **Disks** > **Add Data Disk**.
3. Select the created disk or create a new one.
4. Click **Save**.

### **Azure CLI**
```bash
az vm disk attach \
  --resource-group MyResourceGroup \
  --vm-name MyVM \
  --name MyDisk
```

### **PowerShell**
```powershell
Add-AzVMDataDisk -VMName "MyVM" -ResourceGroupName "MyResourceGroup" -Name "MyDisk" -Lun 1
```

---

## **Step 3: Format and Mount the Disk (Linux/Windows)**

For formatting instructions, check:
- [Linux Disk Initialization Guide](https://learn.microsoft.com/azure/virtual-machines/linux/add-disk?tabs=ubuntu&WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352)
- [Windows Disk Initialization Guide](https://learn.microsoft.com/azure/virtual-machines/disks-redundancy?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352)


