resource "keycloak_user" "alice" {
  lifecycle {
    ignore_changes = [ required_actions ]
  }

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

resource "keycloak_user_groups" "alice" {
  realm_id = keycloak_realm.example.id
  user_id  = keycloak_user.alice.id

  group_ids = [
    keycloak_group.team-a.id,
    keycloak_group.team-b.id,
  ]
}
