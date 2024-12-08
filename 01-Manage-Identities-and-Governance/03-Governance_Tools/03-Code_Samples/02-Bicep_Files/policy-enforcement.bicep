targetScope = 'subscription'

resource policyDefinition 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: 'enforce-tags'
  properties: {
    displayName: 'Enforce Tags on Resources'
    policyType: 'Custom'
    mode: 'All'
    policyRule: {
      if: {
        not: {
          field: 'tags'
          exists: true
        }
      }
      then: {
        effect: 'modify'
        details: {
          field: 'tags'
          value: {
            Environment: 'Production'
          }
        }
      }
    }
  }
}
