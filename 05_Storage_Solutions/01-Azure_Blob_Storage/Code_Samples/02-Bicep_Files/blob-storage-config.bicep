@description('The name of the Storage Account.')
param storageAccountName string = 'mystorageaccount'

@description('The location of the Storage Account.')
param location string = resourceGroup().location

@description('The replication strategy for the Storage Account.')
param skuName string = 'Standard_LRS'

resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: skuName
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}

output storageAccountId string = storageAccount.id
output primaryBlobEndpoint string = storageAccount.properties.primaryEndpoints.blob
