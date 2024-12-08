Add-AzVirtualNetworkSubnetConfig -Name "WebSubnet" -AddressPrefix "10.0.1.0/24" `
    -VirtualNetwork (Get-AzVirtualNetwork -Name "MyVNet" -ResourceGroupName "MyResourceGroup")
