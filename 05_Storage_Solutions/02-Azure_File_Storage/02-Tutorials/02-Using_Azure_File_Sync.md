## **What Is Azure File Sync?**

Azure File Sync enables on-premises file servers to be synced with Azure File Shares, providing hybrid cloud solutions with local cache capabilities.

---

#### **Features of Azure File Sync**

| Feature                 | Description                                                                                     |
|-------------------------|-------------------------------------------------------------------------------------------------|
| **Centralized Storage** | Store files in Azure while keeping frequently accessed files on local servers.                  |
| **Multi-Site Sync**     | Sync files between multiple servers and Azure.                                                 |
| **Cloud Tiering**       | Automatically tiers infrequently used files to the cloud while retaining local stubs.          |
| **Disaster Recovery**   | Quickly restore file access by syncing with Azure in case of local server failure.             |

---

#### **Steps to Use Azure File Sync**

1. **Set Up Azure File Sync**  
   - Create a Storage Sync Service in the Azure Portal.  
     [Quickstart Guide](https://learn.microsoft.com/azure/storage/file-sync/file-sync-deployment-guide?tabs=azure-portal%2Cproactive-portal&WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352)

---

2. **Install the Azure File Sync Agent**  
   - Download and install the Azure File Sync agent on your Windows Server.  
   - Register the server with the Storage Sync Service using the agent.

---

3. **Configure Sync Groups**  
   - In the Azure Portal, create a **Sync Group**.  
   - Add the Azure File Share and the registered server as endpoints.

---

4. **Enable Cloud Tiering (Optional)**  
   - Configure cloud tiering to optimize local storage usage.  
   - Set policies to control when files are tiered to Azure.

---

#### **Best Practices**
- Monitor sync performance using Azure Monitor.  
- Regularly update the File Sync agent to the latest version.  

For in-depth guidance, visit the [Azure File Sync Documentation](https://learn.microsoft.com/azure/storage/file-sync/file-sync-planning?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352).

