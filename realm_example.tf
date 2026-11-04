resource "keycloak_realm" "example" {
  realm                  = "example"
  enabled                = true
  display_name           = "Example SSO"
  password_policy = "lowerCase(1) and length(2) and forceExpiredPasswordChange(365) and notUsername"
}
