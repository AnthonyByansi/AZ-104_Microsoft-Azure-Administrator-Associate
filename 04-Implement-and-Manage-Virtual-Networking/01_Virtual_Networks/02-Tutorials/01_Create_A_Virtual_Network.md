# Tutorial: Create a Virtual Network in Azure

This tutorial guides you through creating a Virtual Network (VNet) in Azure using the Azure Portal, Azure CLI, and PowerShell.

## Prerequisites
- An active Azure subscription. Sign up [here](https://azure.microsoft.com/pricing/purchase-options/azure-account?icid=azurefreeaccount&WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352).
- Proper permissions to create VNets.

## Steps Using Azure Portal
1. Navigate to the [Azure Portal](https://portal.azure.com/).
2. Search for **Virtual Networks** in the top search bar.
3. Click **+ Create** and provide the following details:
   - **Name**: `MyVNet`
   - **Address Space**: `10.0.0.0/16`
   - **Region**: Select a region close to your users.
4. Add subnets as needed under the **Subnets** tab.
5. Click **Review + Create** and then **Create**.

## Steps Using Azure CLI
```bash
# Create a resource group
az group create --name MyResourceGroup --location eastus

# Create a virtual network with a subnet
az network vnet create \
  --name MyVNet \
  --resource-group MyResourceGroup \
  --address-prefix 10.0.0.0/16 \
  --subnet-name MySubnet \
  --subnet-prefix 10.0.0.0/24
```

## Steps Using PowerShell
```powershell
# Create a resource group
New-AzResourceGroup -Name MyResourceGroup -Location eastus

# Create a virtual network and a subnet
New-AzVirtualNetwork -Name MyVNet -ResourceGroupName MyResourceGroup `
  -Location eastus -AddressPrefix 10.0.0.0/16 `
  -Subnet @(@{Name='MySubnet';AddressPrefix='10.0.0.0/24'})
```

For more information, see the [Azure Virtual Network Documentation](https://learn.microsoft.com/azure/virtual-network/?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352).

