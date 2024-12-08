# Tutorial: Set Up Identity Alerts

Identity alerts notify you of risky user behaviors or potential security incidents in real time.

## Steps to Set Up Identity Alerts

### Prerequisites
- Azure AD Premium P2 subscription.
- Access to **Global Administrator** or **Security Administrator** roles.

### Steps
1. **Enable Alerts**:
   - In the [Azure Portal](https://portal.azure.com/), go to **Azure AD** > **Identity Protection**.
   - Under **Alerts**, configure rules to notify about high-risk sign-ins or users.

2. **Configure Notification Recipients**:
   - Add security team email addresses for receiving alerts.

3. **Integrate with SIEM**:
   - Connect Azure AD logs to your SIEM solution for advanced analytics.
   - Use the **Azure Monitor Logs** integration.

4. **Test Alerts**:
   - Simulate a risky sign-in by accessing from a different location or device to ensure notifications trigger as expected.

### Useful Links
- [Configure Alerts in Azure](https://techcommunity.microsoft.com/blog/microsoftthreatprotectionblog/identity-protection-alerts-now-available-in-microsoft-365-defender/3660997?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352)
- [Connect Azure AD Logs to SIEM](https://learn.microsoft.com/defender-cloud-apps/siem?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352)
