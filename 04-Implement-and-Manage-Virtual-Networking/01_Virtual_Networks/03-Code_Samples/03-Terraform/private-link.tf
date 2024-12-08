resource "azurerm_private_endpoint" "example" {
  name                = "MyPrivateEndpoint"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  subnet_id           = azurerm_subnet.example.id

  private_service_connection {
    name                           = "MyPrivateServiceConnection"
    is_manual_connection           = false
    private_connection_resource_id = azurerm_private_link_service.example.id
    subresource_names             = ["subresource"]
  }
}
