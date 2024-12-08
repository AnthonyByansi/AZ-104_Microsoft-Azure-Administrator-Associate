# Tutorial: Enable Service Endpoints in Azure

Service Endpoints secure Azure services by extending the VNet identity directly to the service.

## Prerequisites
- A VNet with at least one subnet configured.

## Supported Services
- Azure Storage
- Azure SQL Database
- Cosmos DB
- More [here](https://learn.microsoft.com/azure/virtual-network/virtual-network-service-endpoints-overview?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352).

## Steps Using Azure Portal
1. Navigate to your VNet.
2. Select the **Subnets** tab and choose a subnet.
3. Under **Service Endpoints**, select a service (e.g., Azure Storage).
4. Click **Save**.

## Steps Using Azure CLI
```bash
# Enable service endpoint for Azure Storage
az network vnet subnet update \
  --vnet-name MyVNet \
  --resource-group MyResourceGroup \
  --name MySubnet \
  --service-endpoints Microsoft.Storage
```

## Steps Using PowerShell
```powershell
# Enable service endpoint for Azure Storage
Set-AzVirtualNetworkSubnetConfig -VirtualNetworkName MyVNet `
  -ResourceGroupName MyResourceGroup -Name MySubnet `
  -AddressPrefix 10.0.1.0/24 -ServiceEndpoint Microsoft.Storage
```

For more details, visit [Azure Service Endpoints Documentation](https://learn.microsoft.com/azure/virtual-network/virtual-network-service-endpoints-overview?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352).

