resource myVnet 'Microsoft.Network/virtualNetworks@2021-02-01' existing = {
  name: 'MyExistingVnetName'
}

resource privateEndpoint 'Microsoft.Network/privateEndpoints@2021-02-01' = {
  name: 'MyPrivateEndpoint'
  location: resourceGroup().location
  properties: {
    subnet: {
      id: resourceId('Microsoft.Network/virtualNetworks/subnets', myVnet.name, 'PrivateLinkSubnet')
    }
    privateLinkServiceConnections: [
      {
        name: 'StorageConnection'
        properties: {
          privateLinkServiceId: resourceId('Microsoft.Storage/storageAccounts', 'MyStorageAccount')
          groupIds: ['blob']
        }
      }
    ]
  }
}
