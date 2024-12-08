resource identityProtection 'Microsoft.Authorization/roleAssignments@2020-04-01-preview' = {
  name: 'IdentityProtectionRole'
  properties: {
    principalId: '<user-or-group-id>'
    roleDefinitionId: '<role-definition-id>'
    // scope: subscription().id
  }
}
