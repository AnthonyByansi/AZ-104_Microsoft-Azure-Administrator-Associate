# **Overview**
Tags in Azure help organize resources by applying metadata in the form of key-value pairs. They simplify resource management, cost tracking, and operational automation.

#### **Best Practices**
| **Practice**                 | **Details**                                                              |
|------------------------------|--------------------------------------------------------------------------|
| Standardize Tag Keys          | Use consistent naming conventions (e.g., `Environment`, `CostCenter`). |
| Automate Tag Application     | Use policies or scripts to enforce tagging standards.                   |
| Monitor Unused Tags          | Regularly clean up outdated or unused tags.                            |

#### **Common Tags**
| **Key**          | **Value Examples**            |
|------------------|------------------------------|
| Environment      | Production, Staging, Dev     |
| CostCenter       | IT, HR, Marketing            |
| Owner            | TeamA, TeamB                 |

#### **Steps to Apply Tags**
1. **Manual Tagging**:
   - Go to a resource in the [Azure Portal](https://portal.azure.com).
   - Select **Tags** and add key-value pairs.
2. **Automate with Azure Policy**:
   - Create a policy for mandatory tags.
   - Assign the policy to enforce tagging.
3. **Use Scripts**:
   - Use PowerShell, CLI, or Terraform for large-scale tagging.

#### **Additional Resources**
- [Azure Tags Overview](https://learn.microsoft.com/azure/azure-resource-manager/management/tag-resources?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352)
- [Automate Tagging with Policy](https://learn.microsoft.com/azure/governance/policy/concepts/effect-basics?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352#append)
