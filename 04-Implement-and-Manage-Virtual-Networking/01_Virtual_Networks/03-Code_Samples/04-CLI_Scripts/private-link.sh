az network private-endpoint create \
  --name MyPrivateEndpoint \
  --resource-group MyResourceGroup \
  --vnet-name MyVNet \
  --subnet WebSubnet \
  --private-connection-resource-id /subscriptions/{subscription-id}/resourceGroups/MyResourceGroup/providers/Microsoft.Storage/storageAccounts/MyStorageAccount \
  --group-id blob
