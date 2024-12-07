# **Overview**
Managing RBAC at the subscription level allows centralized access control for all resources within a subscription, ensuring consistency and reducing misconfigurations.

#### **Steps to Manage Subscription-Level RBAC**
1. **Sign in to Azure Portal**: Go to [Azure Portal](https://portal.azure.com).
2. **Navigate to Subscriptions**:
   - Select **Subscriptions** from the menu.
   - Choose the subscription to manage.
3. **Access Control (IAM)**:
   - Select **Access Control (IAM)** in the menu.
4. **View Role Assignments**:
   - Check existing role assignments for users, groups, or applications.
5. **Add or Modify Roles**:
   - Add, edit, or remove roles as necessary.

#### **Best Practices**
| **Practice**             | **Details**                                                              |
|---------------------------|-------------------------------------------------------------------------|
| Use Built-In Roles        | Prefer built-in roles over custom roles for simpler management.         |
| Principle of Least Privilege | Grant users only the access required for their responsibilities.       |
| Monitor Role Assignments  | Regularly review role assignments to prevent privilege creep.           |

#### **Script Example (Using PowerShell)**
```powershell
# Assign Reader role at subscription level
New-AzRoleAssignment -SignInName "user@domain.com" -RoleDefinitionName "Reader" -Scope "/subscriptions/<subscription-id>"
```

#### **Additional Resources**
- [Azure Subscription Management](https://learn.microsoft.com/cli/azure/manage-azure-subscriptions-azure-cli?tabs=bash&WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352)
- [RBAC Best Practices](https://learn.microsoft.com/azure/role-based-access-control/best-practices?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352)
