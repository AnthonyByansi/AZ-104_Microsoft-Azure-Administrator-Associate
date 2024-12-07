# Tutorial: Manage Guest Users in Azure Active Directory

Azure AD allows organizations to collaborate with external users through guest access. This tutorial explains how to add, manage, and secure guest users.

---

## Steps to Manage Guest Users
1. **Invite a Guest User:**
   - Go to Azure Active Directory > **Users** > **New Guest User**.
   - Provide the email address and customize the invitation message.

2. **Assign Group Membership:**
   - Add the guest user to relevant groups for resource access.

3. **Configure Permissions:**
   - Use **Role-Based Access Control (RBAC)** to assign roles.

4. **Monitor Guest Activity:**
   - Navigate to **Audit Logs** to track guest user activities.

---

## Security Recommendations for Guest Users
| Recommendation                     | Description                                                                                 |
|------------------------------------|---------------------------------------------------------------------------------------------|
| Use **Conditional Access Policies** | Enforce access controls like MFA for guest users.                                           |
| Enable Access Reviews              | Periodically review guest access to ensure compliance.                                      |
| Limit Permissions                  | Assign the least privilege necessary to minimize security risks.                            |

---

### Resources
- [Invite Guest Users](https://azure.microsoft.com/products/active-directory-external-identities/?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352#:~:text=Azure%20Active%20Directory%20External%20Identities%2C%20part%20of%20Microsoft,any%20users%20outside%20your%20organization%20with%20customization%20controls.?msockid=26db05bdfdbc62bb04691083fc2a63e3)
- [Secure Collaboration with External Users](https://learn.microsoft.com/entra/external-id/?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352)
