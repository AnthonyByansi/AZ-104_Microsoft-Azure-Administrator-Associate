# **Overview**
Azure allows the creation of custom roles to define specific permissions tailored to your organizational needs. These roles provide flexibility to enforce the principle of least privilege.

#### **Steps to Create a Custom Role**
1. **Understand Role Requirements**: Determine the actions, scopes, and permissions needed.
2. **Prepare Role Definition**: Use JSON to define the custom role.
3. **Create the Role in Azure**:
   - Use Azure Portal, Azure CLI, or PowerShell to create the role.
4. **Test and Assign**: Assign the custom role to a test user or group to validate functionality.

#### **Example JSON for a Custom Role**
```json
{
  "Name": "CustomReader",
  "Description": "Read-only access to specific resources",
  "Actions": [
    "Microsoft.Compute/virtualMachines/read",
    "Microsoft.Network/networkInterfaces/read"
  ],
  "NotActions": [],
  "AssignableScopes": ["/subscriptions/{subscription-id}"]
}
```

#### **Common Use Cases**
| **Use Case**            | **Action**                                    |
|--------------------------|-----------------------------------------------|
| VM Read Access           | `Microsoft.Compute/virtualMachines/read`      |
| Storage Account Access   | `Microsoft.Storage/storageAccounts/*`         |
| Restrict Network Actions | Exclude `Microsoft.Network/networkSecurityGroups/delete` |

#### **Additional Resources**
- [Create a Custom Role](https://learn.microsoft.com/azure/role-based-access-control/custom-roles?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352)
- [Custom Roles JSON Reference](https://learn.microsoft.com/azure/role-based-access-control/custom-roles-template?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352)
