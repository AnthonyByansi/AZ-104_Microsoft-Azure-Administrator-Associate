az network vnet subnet create \
  --name WebSubnet \
  --resource-group MyResourceGroup \
  --vnet-name MyVNet \
  --address-prefix 10.0.1.0/24
