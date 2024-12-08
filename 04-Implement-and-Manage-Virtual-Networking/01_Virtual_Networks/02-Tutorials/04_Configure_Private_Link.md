# Tutorial: Configure Private Link in Azure

Azure Private Link provides private access to Azure services from your Virtual Network.

## Prerequisites
- A Virtual Network and subnet.
- The resource you want to connect to supports Private Link.

## Steps Using Azure Portal
1. Navigate to the resource you want to enable Private Link for (e.g., a Storage Account).
2. Under **Settings**, select **Private Endpoint Connections** and click **+ Private Endpoint**.
3. Provide the following:
   - **Name**: `MyPrivateEndpoint`
   - **Subnet**: Choose an existing subnet.
4. Click **Review + Create** and then **Create**.

## Steps Using Azure CLI
```bash
# Create a private endpoint
az network private-endpoint create \
  --name MyPrivateEndpoint \
  --resource-group MyResourceGroup \
  --vnet-name MyVNet \
  --subnet MySubnet \
  --private-connection-resource-id "/subscriptions/{subscription-id}/resourceGroups/MyResourceGroup/providers/Microsoft.Storage/storageAccounts/MyStorageAccount" \
  --group-id blob
```

## Steps Using PowerShell
```powershell
# Create a private endpoint
New-AzPrivateEndpoint -Name MyPrivateEndpoint `
  -ResourceGroupName MyResourceGroup `
  -Location eastus `
  -SubnetId "/subscriptions/{subscription-id}/resourceGroups/MyResourceGroup/providers/Microsoft.Network/virtualNetworks/MyVNet/subnets/MySubnet" `
  -PrivateLinkResourceId "/subscriptions/{subscription-id}/resourceGroups/MyResourceGroup/providers/Microsoft.Storage/storageAccounts/MyStorageAccount" `
  -GroupId "blob"
```

For additional details, visit [Azure Private Link Documentation](https://learn.microsoft.com/azure/private-link/).
