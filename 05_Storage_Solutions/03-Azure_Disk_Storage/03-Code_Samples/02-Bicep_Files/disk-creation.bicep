param diskName string = 'myManagedDisk'
param diskSizeGB int = 128
param diskSku string = 'Premium_LRS'

resource managedDisk 'Microsoft.Compute/disks@2021-04-01' = {
  name: diskName
  location: resourceGroup().location
  sku: {
    name: diskSku
  }
  properties: {
    diskSizeGB: diskSizeGB
    creationData: {
      createOption: 'Empty'
    }
  }
}
