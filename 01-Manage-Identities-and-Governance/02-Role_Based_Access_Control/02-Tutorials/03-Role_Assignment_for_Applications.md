# **Overview**
Azure enables role assignments for applications (service principals) to allow them to access resources programmatically.

#### **Steps to Assign a Role to an Application**
1. **Create or Locate Service Principal**:
   - Use Azure Active Directory to find or create an application.
2. **Navigate to Resource**: Open the target resource in Azure Portal.
3. **Open Access Control (IAM)**:
   - Select **Access Control (IAM)** from the menu.
4. **Assign Role to Application**:
   - Click **Add > Add role assignment**.
   - Choose the role and search for the application by its name or service principal ID.
5. **Review and Save**.

#### **Script Example (Using Azure CLI)**
```bash
# Assign "Contributor" role to an application
az role assignment create \
  --assignee <application-id> \
  --role "Contributor" \
  --scope /subscriptions/<subscription-id>/resourceGroups/<resource-group-name>
```

#### **Common Applications**
| **Application Type**       | **Use Case**                             |
|----------------------------|------------------------------------------|
| DevOps Pipelines           | Deploy infrastructure.                  |
| Monitoring Applications    | Read metrics and logs.                  |
| Automation Tools           | Perform scheduled tasks on resources.   |

#### **Additional Resources**
- [Azure AD Applications](https://learn.microsoft.com/entra/identity-platform/quickstart-register-app?tabs=certificate&WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352)
- [Manage Azure RBAC Using Azure CLI](https://learn.microsoft.com/cli/azure/role/assignment?view=azure-cli-latest&WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352)
