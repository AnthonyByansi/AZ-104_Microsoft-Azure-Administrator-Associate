resource myVnet 'Microsoft.Network/virtualNetworks@2021-02-01' = {
  name: 'MyVNet'
  location: resourceGroup().location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    subnets: [
      {
        name: 'Default'
        properties: {
          addressPrefix: '10.0.0.0/24'
        }
      }
    ]
  }
}
