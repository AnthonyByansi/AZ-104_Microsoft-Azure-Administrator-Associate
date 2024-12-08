targetScope = 'tenant'

resource managementGroup 'Microsoft.Management/managementGroups@2021-04-01' = {
  name: 'IT-Mgmt'
  properties: {
    displayName: 'IT Management Group'
  }
}
