@description('Name of the storage account')
param storageAccountName string = 'mystorageaccount'

@description('Location of the storage account')
param location string = 'eastus'

@description('Name of the file share')
param shareName string = 'myshare'

resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: storageAccountName
  location: location
  kind: 'FileStorage'
  sku: {
    name: 'Premium_LRS'
  }
  properties: {
    minimumTlsVersion: 'TLS1_2'
  }
}

resource fileShare 'Microsoft.Storage/storageAccounts/fileServices/shares@2022-09-01' = {
  name: '${storageAccount.name}/default/${shareName}'
  properties: {
    enabledProtocols: 'SMB'
    shareQuota: 1024
  }
}

output shareUrl string = 'https://${storageAccount.name}.file.core.windows.net/${shareName}'
