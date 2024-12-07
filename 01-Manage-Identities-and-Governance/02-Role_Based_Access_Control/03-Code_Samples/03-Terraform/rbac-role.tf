resource "azurerm_role_assignment" "example" {
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = "Contributor"
  principal_id         = var.principal_id
}

variable "principal_id" {
  description = "The object ID of the principal to assign the role to."
  type        = string
}
