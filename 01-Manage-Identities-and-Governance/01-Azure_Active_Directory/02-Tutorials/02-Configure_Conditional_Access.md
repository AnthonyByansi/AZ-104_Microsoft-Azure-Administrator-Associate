# Tutorial: Configure Conditional Access in Azure AD

Conditional Access policies enable organizations to control access to applications and resources based on conditions like user identity, location, and device status. This tutorial walks you through setting up a basic policy.

---

## Steps to Configure Conditional Access
1. **Access Conditional Access:**
   - Navigate to Azure Active Directory > **Security** > **Conditional Access** in the [Azure Portal](https://portal.azure.com).

2. **Create a New Policy:**
   - Click **+ New policy**, give it a name, and choose a scope (users/groups).

3. **Define Conditions:**
   - Configure conditions under tabs like **Sign-in Risk**, **Device Platforms**, or **Locations**.

4. **Set Access Controls:**
   - Under **Grant**, select **Require Multi-Factor Authentication** or other access requirements.

5. **Enable the Policy:**
   - Set the policy to **On** and save.

---

## Example: Require MFA for High-Risk Sign-Ins
| Setting               | Value                                      |
|-----------------------|--------------------------------------------|
| **Users**             | All users                                 |
| **Sign-In Risk**      | High                                      |
| **Access Controls**   | Require Multi-Factor Authentication       |

---

### Resources
- [Getting Started with Conditional Access](https://learn.microsoft.com/entra/identity/conditional-access/?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352)
- [Conditional Access Best Practices](https://learn.microsoft.com/azure/architecture/guide/security/conditional-access-design?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352)
