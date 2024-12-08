resource "azurerm_pim_role_assignment" "pim" {
  principal_id = var.user_id
  role_id      = var.role_id
  scope        = var.scope
  justification = "PIM role assignment for identity protection"
}
