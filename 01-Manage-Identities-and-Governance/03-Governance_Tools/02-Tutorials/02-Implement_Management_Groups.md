## **Objective**
Learn how to implement Azure Management Groups to centralize governance and streamline policy application.

#### **Steps to Implement Management Groups**

1. **Access Management Groups**
   - Sign in to the [Azure Portal](https://portal.azure.com).
   - Search for **Management Groups** in the menu.

2. **Create a Management Group**
   - Click **+ Add Management Group**.
   - Provide:
     - **Management Group ID**: A unique identifier (e.g., IT-Mgmt).
     - **Display Name**: A descriptive name.

3. **Add Subscriptions**
   - Select the created management group.
   - Click **+ Add Subscription** and associate the desired subscriptions.

4. **Assign Policies**
   - Navigate to **Azure Policy** and assign policies to the management group. Policies applied here inherit to all subscriptions.

#### **Best Practices**
| **Practice**                  | **Description**                                    |
|-------------------------------|--------------------------------------------------|
| Hierarchical Grouping         | Group subscriptions by function (e.g., Dev, Prod).|
| Use Naming Conventions        | Follow consistent naming (e.g., Dept-GroupName). |
| Assign at Higher Levels        | Policies at higher levels reduce duplication.    |

#### **Additional Resources**
- [Management Groups Documentation](https://learn.microsoft.com/azure/governance/management-groups/overview?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352)
- [Management Groups Best Practices](https://learn.microsoft.com/azure/governance/management-groups/overview?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352)
