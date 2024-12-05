# **Lifecycle_Management.md**

#### **Lifecycle Management in Azure Blob Storage**

Azure Blob Storage supports **Lifecycle Management Policies**, enabling automated data tiering and deletion to optimize costs and meet compliance requirements. By defining rules, organizations can manage data transitions across storage tiers (Hot, Cool, and Archive) or schedule deletion of obsolete data.  

---

#### **Key Scenarios for Lifecycle Management**  

| **Scenario**                   | **Example**                                                                                   |
|---------------------------------|-----------------------------------------------------------------------------------------------|
| **Data Archival**               | Automatically move logs older than 90 days to the Archive tier to save costs.                |
| **Temporary File Cleanup**      | Delete files older than 180 days from a container storing transient application data.         |
| **Multi-Tier Data Lifecycle**   | Transition files from Hot to Cool tier after 30 days, and to Archive tier after 120 days.     |

---

#### **Creating a Lifecycle Management Policy**  

1. Navigate to your storage account in the Azure portal.  
2. Go to **Data Management** > **Lifecycle Management**.  
3. Define rules using JSON or the Azure Portal UI.  

---

#### **Sample Lifecycle Policy**

```json
{
  "rules": [
    {
      "name": "move-to-cool",
      "enabled": true,
      "type": "Lifecycle",
      "definition": {
        "filters": {
          "blobTypes": ["blockBlob"],
          "prefixMatch": ["logs/"]
        },
        "actions": {
          "baseBlob": {
            "tierToCool": {
              "daysAfterModificationGreaterThan": 30
            }
          }
        }
      }
    }
  ]
}
```

---

#### **Learn More**  
- [Azure Lifecycle Management Documentation](https://learn.microsoft.com/azure/storage/blobs/lifecycle-management-overview?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352)  
- [Pricing Tiers and Cost Optimization](https://learn.microsoft.com/azure/storage/blobs/access-tiers-overview?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352) 

