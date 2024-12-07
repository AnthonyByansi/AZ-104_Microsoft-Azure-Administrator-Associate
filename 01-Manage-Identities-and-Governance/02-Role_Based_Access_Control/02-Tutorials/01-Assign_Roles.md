# **Overview**
Role assignment in Azure enables you to grant fine-grained access control to resources. With Role-Based Access Control (RBAC), you can assign users, groups, or applications specific roles that allow them to perform actions without unnecessary permissions.

## **Steps to Assign a Role**
1. **Sign in to Azure Portal**: Navigate to [Azure Portal](https://portal.azure.com).
2. **Locate Resource**: Identify the resource for which you want to assign the role (e.g., a subscription, resource group, or individual resource).
3. **Open Access Control (IAM)**:
   - Go to the resource.
   - Select **Access Control (IAM)** in the menu.
4. **Add Role Assignment**:
   - Click **Add > Add role assignment**.
   - Choose the role from the list of available roles.
   - Assign access to a user, group, or service principal.
5. **Review and Save**: Confirm the settings and click **Save**.

## **Example Roles**
| **Role Name**       | **Description**                                 | **Scope Level**            |
|----------------------|-----------------------------------------------|----------------------------|
| Owner               | Full access to all resources.                  | Subscription/Resource Group|
| Contributor         | Manage resources without managing permissions. | Resource Group/Resource    |
| Reader              | View resources only.                           | All levels                 |

#### **Additional Resources**
- [Role-Based Access Control Overview](https://learn.microsoft.com/azure/role-based-access-control/overview?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352)
- [Assign Azure Roles](https://learn.microsoft.com/azure/role-based-access-control/role-assignments-portal?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352l)


