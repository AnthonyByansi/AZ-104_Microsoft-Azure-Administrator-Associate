# Tutorial: Secure Administrator Accounts

Securing administrator accounts is essential to prevent breaches that target privileged roles.

## Best Practices to Secure Admin Accounts
| **Practice**                  | **Description**                                                                                   |
|-------------------------------|---------------------------------------------------------------------------------------------------|
| Enable Multi-Factor Authentication (MFA) | Add an extra layer of security for all admin sign-ins.                                     |
| Use Conditional Access Policies          | Restrict access to trusted locations or devices only.                                      |
| Implement Privileged Identity Management (PIM) | Configure JIT access for admin roles to minimize exposure.                                |
| Enforce Password Policies                | Use complex, unique passwords and enable periodic password rotation.                      |
| Monitor Admin Activity                   | Regularly audit logs for unusual activity or role changes.                                |

## Steps to Secure Admin Accounts
1. **Enable MFA**:
   - Navigate to **Azure AD** > **Users** > **Multi-Factor Authentication**.
   - Enforce MFA for all admin accounts.

2. **Set Conditional Access Policies**:
   - Go to **Security** > **Conditional Access**.
   - Create policies for admin accounts to restrict sign-ins to known IPs or compliant devices.

3. **Enable PIM for Admin Roles**:
   - Use [Privileged Identity Management](https://learn.microsoft.com/entra/id-governance/privileged-identity-management/?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352) to provide time-limited role activation.

4. **Audit and Monitor**:
   - Regularly check **Sign-in logs** and **Audit logs** in Azure AD.

### Useful Links
- [Secure Access Best Practices](https://learn.microsoft.com/azure/security/fundamentals/identity-management-best-practices?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352)
- [Azure Conditional Access](https://learn.microsoft.com/entra/identity/conditional-access/overview?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352)