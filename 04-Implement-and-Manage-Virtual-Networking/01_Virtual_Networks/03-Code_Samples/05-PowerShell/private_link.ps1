New-AzPrivateEndpoint -Name "MyPrivateEndpoint" `
    -ResourceGroupName "MyResourceGroup" `
    -Location "eastus" `
    -SubnetId "/subscriptions/{subscription-id}/resourceGroups/MyResourceGroup/providers/Microsoft.Network/virtualNetworks/MyVNet/subnets/WebSubnet" `
    -PrivateLinkResourceId "/subscriptions/{subscription-id}/resourceGroups/MyResourceGroup/providers/Microsoft.Storage/storageAccounts/MyStorageAccount" `
    -GroupId "blob"
