# Tutorial: Configure Identity Protection in Azure AD

This tutorial outlines how to set up Azure Identity Protection to detect and respond to user and sign-in risks.

## Steps to Configure Identity Protection

### Prerequisites
- Azure AD Premium P2 license.
- Access to **Security Administrator** or **Global Administrator** roles.

### Steps
1. **Access Identity Protection**:
   - Sign in to the [Azure Portal](https://portal.azure.com/).
   - Navigate to **Azure AD** > **Security** > **Identity Protection**.

2. **Define Risk Policies**:
   - Click on **User Risk Policy** or **Sign-in Risk Policy**.
   - Configure the policy thresholds:
     - Set **High**, **Medium**, or **Low** risk levels.
     - Select enforcement actions, such as **MFA** or **Access Blocking**.

3. **Enable Risk Detection Alerts**:
   - Go to **Alerts** and configure notifications for administrators to stay informed of identity risks.

4. **Monitor and Respond**:
   - Use the **Risky Users** and **Risky Sign-ins** tabs to investigate and remediate threats.

### Risk Policy Example
| **Risk Policy**   | **Condition**                | **Action**                  |
|--------------------|------------------------------|-----------------------------|
| User Risk Policy   | High Risk Users Detected     | Block Access                |
| Sign-in Risk Policy| Risky Sign-in from Unknown IP| Require MFA Authentication |

### Useful Links
- [Azure Identity Protection Policies](https://learn.microsoft.com/entra/id-protection/concept-identity-protection-policies?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352)
