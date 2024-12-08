variable "principal_id" {
  type        = string
  description = "The ID of the principal (user or group) to assign the role to"
}

resource "azurerm_role_assignment" "identity_protection" {
  principal_id   = var.principal_id
  role_definition_name = "User Access Administrator"
  scope          = data.azurerm_subscription.primary.id
}
