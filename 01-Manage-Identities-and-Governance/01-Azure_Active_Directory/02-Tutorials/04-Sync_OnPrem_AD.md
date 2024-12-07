# Tutorial: Sync On-Premises Active Directory with Azure AD

Azure AD Connect allows you to synchronize your on-premises Active Directory with Azure AD, enabling seamless hybrid identity solutions.

---

## Steps to Sync On-Prem AD
1. **Download Azure AD Connect:**
   - [Download here](https://www.microsoft.com/en-us/download/details.aspx?id=47594).

2. **Install Azure AD Connect:**
   - Launch the installer and choose the appropriate sync option (e.g., Password Hash Sync or Pass-Through Authentication).

3. **Configure Directory Synchronization:**
   - Specify your on-premises Active Directory and Azure AD credentials.

4. **Enable Hybrid Features:**
   - Turn on optional features like password writeback or device synchronization.

---

## Common Sync Scenarios
| Scenario                         | Feature                          | Documentation Link                                                                                  |
|----------------------------------|----------------------------------|-----------------------------------------------------------------------------------------------------|
| **Password Sync**                | Sync user passwords to Azure AD. | [Password Synchronization](https://learn.microsoft.com/entra/identity/hybrid/connect/how-to-connect-password-hash-synchronization?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352) |
| **Pass-Through Authentication**  | Validate passwords on-premises.  | [Pass-Through Authentication](https://learn.microsoft.com/entra/identity/hybrid/connect/how-to-connect-pta?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352)                       |
| **Seamless SSO**                 | Enable single sign-on for users. | [Seamless SSO Setup](https://learn.microsoft.com/entra/identity/hybrid/connect/how-to-connect-sso?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352)                                |

---

### Resources
- [Azure AD Connect Documentation](https://learn.microsoft.com/entra/identity/hybrid/?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352)
- [Hybrid Identity Overview](https://learn.microsoft.com/entra/identity/hybrid/whatis-hybrid-identity?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352)
