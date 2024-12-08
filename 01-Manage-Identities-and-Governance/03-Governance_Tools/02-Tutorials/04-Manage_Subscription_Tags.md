## **Objective**
This tutorial demonstrates how to use Azure Tags to manage and organize subscriptions and resources.

#### **Steps to Manage Tags**

1. **Apply Tags via Portal**
   - Go to a subscription or resource group in the [Azure Portal](https://portal.azure.com).
   - Navigate to **Tags** > **+ Add Tag**.
   - Add key-value pairs (e.g., `Environment=Production`).

2. **Automate Tags with Azure Policy**
   - Create a policy to enforce tagging standards.
   - Example JSON:
     ```json
     {
         "if": {
             "field": "tags.CostCenter",
             "equals": null
         },
         "then": {
             "effect": "modify",
             "details": {
                 "field": "tags.CostCenter",
                 "value": "IT"
             }
         }
     }
     ```

3. **Tagging with Scripts**
   - **PowerShell**:
     ```powershell
     Set-AzResource -ResourceGroupName "ResourceGroup1" -Tag @{Department="HR"; Environment="Prod"}
     ```
   - **CLI**:
     ```bash
     az tag create --resource-id /subscriptions/{subscriptionId} --tags Environment=Prod Owner=Admin
     ```

4. **Monitor and Cleanup Tags**
   - Use Azure Resource Graph queries to list untagged resources for review.

#### **Common Tag Scenarios**
| **Key**           | **Value**                | **Use Case**                       |
|-------------------|--------------------------|------------------------------------|
| Environment       | Dev, Test, Prod          | Resource classification.           |
| CostCenter        | IT, Finance, Marketing   | Budgeting and expense tracking.    |
| Owner             | TeamA, TeamB             | Resource accountability.           |

#### **Additional Resources**
- [Azure Tags Overview](https://learn.microsoft.com/azure/azure-resource-manager/management/tag-resources)
- [Automate Tagging with Policy](https://learn.microsoft.com/azure/governance/policy/concepts/effect-basics?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352#modify)