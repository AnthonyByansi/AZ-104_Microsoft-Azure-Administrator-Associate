resource "azurerm_policy_definition" "tagging_policy" {
  name         = "tagging-policy"
  display_name = "Tagging Strategy"
  policy_type  = "Custom"
  mode         = "All"

  policy_rule = jsonencode({
    "if": {
      "field": "tags.CostCenter",
      "equals": null
    },
    "then": {
      "effect": "deny"
    }
  })
}
 