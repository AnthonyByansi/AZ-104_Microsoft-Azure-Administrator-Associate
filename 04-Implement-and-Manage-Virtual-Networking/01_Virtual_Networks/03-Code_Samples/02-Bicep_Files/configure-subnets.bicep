resource myVnet 'Microsoft.Network/virtualNetworks@2021-02-01' = {
  name: 'myVirtualNetwork'
  location: resourceGroup().location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.1.0.0/16'
      ]
    }
  }
}

resource mySubnet 'Microsoft.Network/virtualNetworks/subnets@2021-02-01' = {
  name: 'AppSubnet'
  parent: myVnet
  properties: {
    addressPrefix: '10.1.2.0/24'
  }
}
