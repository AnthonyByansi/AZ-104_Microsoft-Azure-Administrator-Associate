resource "azuread_conditional_access_policy" "example" {
  display_name = "MFA for All Users"
  state        = "enabled"
  conditions {
    client_app_types = ["all"]
    users {
      included_users = ["All"]
    }
    applications {
      included_applications = ["All"]
    }
  }
  grant_controls {
    operator = "OR"
    built_in_controls = ["mfa"]
  }
}
