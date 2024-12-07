# Overview of Role-Based Access Control (RBAC) in Azure

Role-Based Access Control (RBAC) in Azure provides fine-grained access management for Azure resources. With RBAC, you can assign roles to users, groups, or service principals at different scopes, such as subscriptions, resource groups, or specific resources.

---

## Key Features of RBAC

| **Feature**             | **Description**                                                                                      |
|--------------------------|------------------------------------------------------------------------------------------------------|
| **Granular Permissions** | Assign precise access levels to users, groups, or service principals.                              |
| **Built-In Roles**       | Predefined roles that cover common access needs.                                                   |
| **Custom Roles**         | Create roles tailored to your organization's specific requirements.                                 |
| **Scope Assignment**     | Apply roles at different scopes: subscription, resource group, or individual resources.             |
| **Audit Logs**           | Track and monitor role assignments and access changes for compliance and troubleshooting.           |

---

## Common Scenarios
1. Assign the **Contributor** role to developers for managing resources in a specific resource group.
2. Use the **Reader** role to provide read-only access to team members.
3. Create custom roles for service accounts with permissions restricted to specific actions.

---

## Benefits of RBAC
- **Least Privilege Access:** Assign only the permissions necessary to perform tasks.
- **Improved Security:** Reduce the attack surface by limiting access.
- **Simplified Management:** Easily manage and review access levels with a hierarchical structure.

---

### Learn More
- [What is RBAC?](https://learn.microsoft.com/azure/role-based-access-control/overview?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352)
- [Manage Access Using RBAC](https://learn.microsoft.com/azure/role-based-access-control/role-assignments-portal?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352)
