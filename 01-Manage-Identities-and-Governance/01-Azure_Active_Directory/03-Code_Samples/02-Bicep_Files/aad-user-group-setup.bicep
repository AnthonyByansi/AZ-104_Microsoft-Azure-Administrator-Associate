param userName string
param displayName string
param mailNickname string
param userPrincipalName string
param password string
param groupName string
param groupDisplayName string

resource user 'Microsoft.Graph/users@1.0' = {
  name: userName
  properties: {
    displayName: displayName
    mailNickname: mailNickname
    userPrincipalName: userPrincipalName
    passwordProfile: {
      password: password
      forceChangePasswordNextSignIn: false
    }
  }
}

resource group 'Microsoft.Graph/groups@1.0' = {
  name: groupName
  properties: {
    displayName: groupDisplayName
    securityEnabled: true
    mailEnabled: false
  }
}
