# Tutorial: Enable Privileged Identity Management (PIM)

Azure AD Privileged Identity Management (PIM) helps you secure privileged roles by granting just-in-time access and reducing excessive permissions.

## Step-by-Step Guide

### Prerequisites
1. **Global Administrator** or **Privileged Role Administrator** access in Azure AD.
2. Ensure your Azure AD tenant has an active Premium P2 license.

### Steps to Enable PIM
1. **Sign in to the Azure Portal**:
   - Navigate to [Azure Portal](https://portal.azure.com/).
   - Go to **Azure Active Directory** > **Privileged Identity Management**.

2. **Onboard PIM**:
   - Click on **Azure AD roles** > **Onboard**.
   - Follow the prompts to enable PIM for your directory.

3. **Assign Eligible Roles**:
   - Go to **Roles** and select the role you want to configure.
   - Click **Add assignments** and choose **Eligible** for just-in-time access.

4. **Set Role Activation Settings**:
   - Define activation requirements like **MFA**, **justification**, or **approval workflows**.

5. **Review and Save**:
   - Confirm the configurations and save your changes.

### Useful Links
- [Azure AD PIM Documentation](https://learn.microsoft.com/entra/id-governance/privileged-identity-management/?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352)
- [How to Onboard PIM](https://learn.microsoft.com/entra/id-governance/privileged-identity-management/pim-how-to-change-default-settings?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352)

