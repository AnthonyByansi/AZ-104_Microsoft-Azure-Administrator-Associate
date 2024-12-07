# Built-In Roles in Azure RBAC

Azure provides several predefined roles to cover common access needs. These roles simplify access management by grouping permissions.

---

## Common Built-In Roles

| **Role**                | **Description**                                                                                   | **Scope**                       |
|--------------------------|---------------------------------------------------------------------------------------------------|----------------------------------|
| **Owner**               | Full access to manage resources, including the ability to assign roles.                          | Subscription, Resource Group    |
| **Contributor**         | Create and manage resources but cannot assign roles.                                             | Subscription, Resource Group    |
| **Reader**              | View all resources but cannot make changes.                                                      | Subscription, Resource Group    |
| **User Access Administrator** | Manage user access to Azure resources.                                                       | Subscription, Resource Group    |
| **Storage Blob Data Reader**  | Provides read-only access to Azure Blob Storage.                                              | Storage Account                 |

---

## Role Use Cases
- Assign the **Owner** role to subscription administrators to manage all resources.
- Use the **Reader** role for auditors who need to view configurations without making changes.
- Apply the **Contributor** role for developers requiring resource creation and management permissions.

---

## Detailed Role Documentation
| **Role Name**              | **Description**                                                                                  | **Documentation Link**                                                                                    |
|----------------------------|--------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------|
| **Owner**                  | Full control, including assigning roles.                                                        | [Owner Role](https://learn.microsoft.com/azure/role-based-access-control/built-in-roles?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352#owner)      |
| **Contributor**            | Full resource management, excluding access permissions.                                         | [Contributor Role](https://learn.microsoft.com/azure/role-based-access-control/built-in-roles?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352#contributor) |
| **Reader**                 | Read-only access to resources.                                                                  | [Reader Role](https://learn.microsoft.com/en-us/azure/role-based-access-control/built-in-roles#reader)    |
| **Storage Blob Data Reader** | Grants read access to blob data in a storage account.                                          | [Blob Reader Role](https://learn.microsoft.com/azure/role-based-access-control/built-in-roles?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352#storage-blob-data-reader) |

---

### Learn More
- [Azure Built-In Roles](https://learn.microsoft.com/azure/role-based-access-control/built-in-roles?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352)
- [How RBAC Works](https://learn.microsoft.com/azure/role-based-access-control/overview?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352)
