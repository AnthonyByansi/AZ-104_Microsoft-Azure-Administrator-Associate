
resource "azurerm_policy_definition" "enforce_tags" {
  name         = "enforce-tags"
  display_name = "Enforce Tags on Resources"
  policy_type  = "Custom"
  mode         = "Indexed"

  policy_rule = jsonencode({
    "if": {
      "not": {
        "field": "tags",
        "exists": true
      }
    },
    "then": {
      "effect": "modify",
      "details": {
        "field": "tags",
        "value": {
          "Environment": "Production"
        }
      }
    }
  })
}
