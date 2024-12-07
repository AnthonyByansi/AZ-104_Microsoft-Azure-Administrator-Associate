## **How to Configure NFS Shares in Azure File Storage**

Azure File Storage supports **Network File System (NFS)** for scenarios requiring a high-performance, shared file system for Linux-based workloads.

---

#### **Prerequisites**
- A **Premium FileStorage** account.
- A virtual network configured to allow private access. Refer to [Private Endpoints](https://learn.microsoft.com/azure/private-link/private-endpoint-overview?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352).

---

#### **Steps to Configure NFS Shares**

1. **Create a Storage Account**  
   - Use the Azure Portal or CLI to create a **Premium FileStorage** account with NFS enabled.

   ```bash
   az storage account create --name <storage-account-name> --resource-group <resource-group> --location <region> --sku Premium_LRS --kind FileStorage --enable-large-file-share
   ```

---

2. **Create a File Share**  
   - Use the Azure CLI to create an NFS-enabled share:
     ```bash
     az storage share-rm create --resource-group <resource-group> --storage-account <storage-account-name> --name <share-name> --enabled-protocol NFS
     ```

---

3. **Configure Mount Points on Linux**  
   - Install the required NFS client tools:
     ```bash
     sudo apt-get install nfs-common
     ```
   - Mount the NFS share to a local directory:
     ```bash
     sudo mount -t nfs <storage-account-name>.file.core.windows.net:/<share-name> /mnt/nfsshare
     ```

---

#### **Performance Tiers for NFS**

| Tier           | Use Case                             | Max Throughput | Latency   |
|----------------|--------------------------------------|----------------|-----------|
| **Premium**    | High-performance computing workloads | Up to 10 GiB/s | Low       |

---

#### **Learn More**
- [NFS in Azure Files](https://learn.microsoft.com/azure/storage/files/storage-files-quick-create-use-linux?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352)  
- [NFS Protocol Support](https://learn.microsoft.com/azure/storage/files/files-nfs-protocol?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352)  