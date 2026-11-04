resource "keycloak_user" "alice" {
  realm_id = keycloak_realm.example.id
  username = "alice"
  enabled  = true

  email          = "alice@sikademo.com"
  email_verified = true
  first_name     = "Alice"
  last_name      = "Demo"

  initial_password {
    value     = "aa"
    temporary = true
  }
}
