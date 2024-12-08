# **Overview**
Azure Management Groups provide a mechanism for organizing subscriptions into a hierarchy to efficiently manage governance at scale.

#### **Key Concepts**
| **Concept**               | **Description**                                                                   |
|---------------------------|-----------------------------------------------------------------------------------|
| Management Group          | A container for organizing subscriptions.                                         |
| Hierarchical Inheritance  | Permissions and policies apply to all subscriptions within the group.             |
| Root Management Group     | The top-level group that all management groups and subscriptions belong to.       |

#### **Steps to Implement Management Groups**
1. **Access Management Groups**:
   - Open the [Azure Portal](https://portal.azure.com).
   - Search for **Management Groups**.
2. **Create a Management Group**:
   - Click **+ Add Management Group**.
   - Provide a unique **Management Group ID** and **Display Name**.
3. **Add Subscriptions**:
   - Select the management group.
   - Click **Add Subscription** to associate a subscription.
4. **Assign Policies and Roles**:
   - Apply Azure Policies or RBAC at the group level for inheritance.

#### **Use Case Examples**
| **Scenario**                | **Action**                                              |
|-----------------------------|--------------------------------------------------------|
| Enterprise Governance       | Centralize subscription policies.                     |
| Cost Management             | Monitor spending across multiple subscriptions.       |
| Security Enforcement        | Apply consistent security policies.                   |

#### **Additional Resources**
- [Management Groups Overview](https://learn.microsoft.com/azure/governance/management-groups/overview?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352)
- [Best Practices for Management Groups](https://learn.microsoft.com/azure/governance/management-groups/azure-management?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352)