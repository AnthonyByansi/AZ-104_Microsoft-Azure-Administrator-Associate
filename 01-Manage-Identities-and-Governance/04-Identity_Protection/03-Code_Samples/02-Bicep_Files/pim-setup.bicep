resource pimSetup 'Microsoft.Authorization/roleAssignments@2020-04-01-preview' = {
  name: 'PIMSetup'
  properties: {
    roleDefinitionId: '<roleDefinitionId>'
    principalId: '<principalId>'
    principalType: 'User'
  }
}
