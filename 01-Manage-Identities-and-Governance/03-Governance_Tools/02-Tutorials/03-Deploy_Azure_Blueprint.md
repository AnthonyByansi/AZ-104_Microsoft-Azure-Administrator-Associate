## **Objective**
Learn how to create and deploy an Azure Blueprint to standardize and automate resource deployments.

#### **Steps to Deploy an Azure Blueprint**

1. **Create a Blueprint**
   - Navigate to [Azure Blueprints](https://portal.azure.com) in the portal.
   - Click **+ Create Blueprint**.
   - Provide a **Name**, select a **Location**, and define the **Blueprint Structure**.

2. **Add Artifacts**
   - Add components like:
     - **Policy Assignments**: Enforce compliance.
     - **Role Assignments**: Assign roles for resource access.
     - **ARM Templates**: Deploy pre-configured resources.

3. **Publish the Blueprint**
   - After completing the structure, click **Publish**.
   - Specify a version (e.g., `v1.0`) and publish.

4. **Assign the Blueprint**
   - Click **Assign Blueprint**.
   - Select a subscription or resource group as the target scope.
   - Monitor deployment progress.

#### **Benefits**
| **Feature**         | **Description**                                        |
|---------------------|-------------------------------------------------------|
| Repeatability       | Standardize deployments across environments.          |
| Governance          | Embed policies and role assignments into resources.   |
| Scalability         | Apply at subscription or management group levels.     |

#### **Additional Resources**
- [Azure Blueprints Overview](https://learn.microsoft.com/azure/governance/blueprints/overview?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352)
- [Blueprint Artifacts Guide](https://learn.microsoft.com/azure/governance/blueprints/samples/?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352)