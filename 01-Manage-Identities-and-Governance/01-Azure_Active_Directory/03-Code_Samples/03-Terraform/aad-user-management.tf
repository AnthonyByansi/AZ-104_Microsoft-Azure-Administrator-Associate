resource "azuread_user" "example_user" {
  display_name          = "John Doe"
  mail_nickname         = "jdoe"
  user_principal_name   = "jdoe@example.com"
  password              = "ComplexPassword123!"
  force_password_change = false
}

resource "azuread_group" "example_group" {
  display_name     = "Developers"
  security_enabled = true
  mail_enabled     = false
}
