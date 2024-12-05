# **Access_Tokens_and_SAS.md**

#### **Understanding Access Tokens and SAS in Azure Blob Storage**

Azure Blob Storage leverages **Shared Access Signatures (SAS)** and **OAuth Tokens** for secure, time-limited access to resources. These mechanisms ensure granular control over access to storage containers, blobs, queues, and tables.

---

#### **Key Types of Tokens**  

| **Type**         | **Description**                                                                                                                                      |
|-------------------|------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Shared Access Signature (SAS)** | Grants temporary access to storage resources. Can be limited by IP, time, permissions, and more.                                      |
| **OAuth Token**   | Supports Azure Active Directory (Azure AD) for user and service-based authentication without sharing keys.                                           |

---

#### **Generating SAS Tokens**  

1. Navigate to the container or blob in the Azure portal.  
2. Click **Generate SAS** and specify permissions, expiry, and restrictions.  
3. Use the generated URL to access the resource securely.  

---

#### **SAS Example**  

A **read-only SAS** URL for a blob:  
```
https://<storage_account>.blob.core.windows.net/<container>/<blob>?sv=2023-01-01&ss=b&srt=o&sp=r&se=2024-12-31T23:59:59Z&sig=<signature>
```

---

#### **When to Use Access Tokens vs. SAS**  

| **Scenario**                      | **Recommended Approach**         |
|-----------------------------------|-----------------------------------|
| **Temporary access for clients**   | Use SAS for time-limited URLs.    |
| **Service-to-service integration**| Use Azure AD OAuth Tokens.        |

---

#### **Learn More**  
- [SAS Overview](https://learn.microsoft.com/azure/storage/common/storage-sas-overview?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352) 
- [Azure AD Integration](https://learn.microsoft.com/rest/api/storageservices/delegate-access-with-shared-access-signature?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352)
