# Creating Custom Roles in Azure RBAC

Custom roles in Azure RBAC allow you to define permissions that precisely meet your organizational requirements. They complement the built-in roles by offering flexibility.

---

## Steps to Create a Custom Role

1. **Define the Role:**
   - Identify the permissions required.
   - Specify actions to include or exclude.

2. **Create the Role:**
   - Use Azure Portal, CLI, PowerShell, or an ARM template.

3. **Assign the Role:**
   - Assign the role to users, groups, or service principals at the required scope.

---

## Example: Custom Role JSON Template

```json
{
  "Name": "Custom VM Reader",
  "Description": "Allows read access to virtual machines.",
  "Actions": [
    "Microsoft.Compute/virtualMachines/read"
  ],
  "NotActions": [],
  "AssignableScopes": [
    "/subscriptions/{subscriptionId}"
  ]
}
```

---

## Tools for Creating Custom Roles

| **Tool**        | **Command/Method**                                                                                         | **Documentation**                                                                 |
|------------------|-----------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------|
| **Azure CLI**   | `az role definition create --role-definition role-definition.json`                                         | [Azure CLI Custom Roles](https://learn.microsoft.com/azure/role-based-access-control/custom-roles-cli?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352) |
| **PowerShell**  | `New-AzRoleDefinition -InputFile role-definition.json`                                                     | [PowerShell Custom Roles](https://learn.microsoft.com/azure/role-based-access-control/custom-roles-powershell?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352) |
| **Portal**      | Navigate to **Azure AD > Roles and Administrators > New Custom Role**                                       | [Portal Custom Roles](https://learn.microsoft.com/azure/role-based-access-control/custom-roles-portal?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352) |

---

## Common Use Cases for Custom Roles
| **Scenario**                      | **Description**                                                   |
|-----------------------------------|-------------------------------------------------------------------|
| **Limited Blob Storage Access**   | Allow specific actions like read and write but deny delete.       |
| **Scoped DevOps Permissions**     | Grant pipeline access to specific resources in a resource group.  |

---

### Learn More
- [Custom Roles Overview](https://learn.microsoft.com/azure/role-based-access-control/custom-roles?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352)
- [Role Definition Schema](https://learn.microsoft.com/azure/role-based-access-control/overview?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352)
