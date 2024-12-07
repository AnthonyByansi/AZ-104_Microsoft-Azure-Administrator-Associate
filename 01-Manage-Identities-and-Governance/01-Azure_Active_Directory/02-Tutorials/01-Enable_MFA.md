# Tutorial: Enable Multi-Factor Authentication (MFA) in Azure Active Directory

Multi-Factor Authentication (MFA) adds an extra layer of security to user sign-ins by requiring a second form of verification. This tutorial guides you through enabling MFA for your Azure AD users.

---

## Steps to Enable MFA
1. **Sign in to the Azure Portal:**
   - Go to [Azure Portal](https://portal.azure.com) and navigate to Azure Active Directory.

2. **Access MFA Settings:**
   - Under "Security," select **Multi-Factor Authentication**.

3. **Select Users:**
   - Choose the users or groups you want to enforce MFA for.

4. **Enable MFA:**
   - Click **Enable** and confirm the settings.

5. **Configure Verification Methods:**
   - Navigate to "Authentication Methods" to set up options like text messages, phone calls, or authenticator apps.

---

## Best Practices
| Recommendation                         | Description                                                                                      |
|----------------------------------------|--------------------------------------------------------------------------------------------------|
| Use the **Authenticator App**          | The Microsoft Authenticator app provides secure and convenient MFA.                              |
| Enable MFA for Admin Accounts          | Always enforce MFA for privileged accounts.                                                     |
| Combine with Conditional Access Policies | Use Conditional Access to enforce MFA for high-risk sign-ins.                                    |

---

### Resources
- [How to Enable MFA](https://learn.microsoft.com/entra/identity/authentication/howto-mfa-getstarted?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352)
- [Azure AD Security Best Practices](https://learn.microsoft.com/azure/security/fundamentals/identity-management-best-practices?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352)
