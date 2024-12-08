# Tutorial: Configure Subnets in Azure Virtual Network

This tutorial walks through subnet creation and configuration to segment traffic in your Virtual Network.

## Prerequisites
- A Virtual Network already created. Refer to [Create a Virtual Network](./Create_A_Virtual_Network.md).

## Steps Using Azure Portal
1. Navigate to your VNet in the [Azure Portal](https://portal.azure.com/).
2. Under **Settings**, select **Subnets** and click **+ Subnet**.
3. Provide the following details:
   - **Name**: `WebSubnet`
   - **Address Range**: `10.0.1.0/24`
4. Click **Save**.

## Steps Using Azure CLI
```bash
# Add a subnet to an existing VNet
az network vnet subnet create \
  --vnet-name MyVNet \
  --resource-group MyResourceGroup \
  --name WebSubnet \
  --address-prefix 10.0.1.0/24
```

## Steps Using PowerShell
```powershell
# Add a subnet to an existing VNet
Add-AzVirtualNetworkSubnetConfig -Name WebSubnet `
  -AddressPrefix 10.0.1.0/24 `
  -VirtualNetwork (Get-AzVirtualNetwork -Name MyVNet -ResourceGroupName MyResourceGroup)
```

For detailed guidance, visit the [Azure Subnets Documentation](https://learn.microsoft.com/azure/virtual-network/virtual-network-manage-subnet?tabs=azure-portal&WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352).


