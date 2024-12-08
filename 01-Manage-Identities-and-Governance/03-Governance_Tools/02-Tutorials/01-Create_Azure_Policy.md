## **Objective**
This tutorial guides you through creating and assigning an Azure Policy to enforce compliance across resources.

#### **Prerequisites**
- Azure subscription.
- Appropriate permissions (e.g., **Owner** or **Policy Contributor** role).

#### **Steps to Create and Assign an Azure Policy**

1. **Navigate to Azure Policy**
   - Open the [Azure Portal](https://portal.azure.com).
   - Search for **Policy** in the top search bar.

2. **Define a New Policy**
   - Go to **Definitions** and click **+ Policy definition**.
   - Fill in the following:
     - **Display Name**: A descriptive name (e.g., Enforce Resource Tags).
     - **Category**: Choose or create a category.
     - **Policy Rule**: Specify the JSON rule. For example:
       ```json
       {
           "if": {
               "field": "tags",
               "equals": null
           },
           "then": {
               "effect": "append",
               "details": {
                   "field": "tags",
                   "value": {
                       "Environment": "Production"
                   }
               }
           }
       }
       ```

3. **Assign the Policy**
   - Select **Assignments** > **+ Assign Policy**.
   - Fill in:
     - **Scope**: Choose a subscription or resource group.
     - **Policy Definition**: Select the newly created policy.

4. **Validate Compliance**
   - Go to the **Compliance** tab under Policy to view the status of resources.

#### **Additional Resources**
- [Azure Policy Documentation](https://learn.microsoft.com/azure/governance/policy/overview?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352)
- [Policy JSON Reference](https://learn.microsoft.com/azure/governance/policy/concepts/definition-structure-basics?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352)