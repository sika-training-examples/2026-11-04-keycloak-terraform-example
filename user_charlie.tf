resource "keycloak_user" "charlie" {
  lifecycle {
    ignore_changes = [ required_actions, federated_identity ]
  }

  realm_id = keycloak_realm.example.id
  username = "charlie"
  enabled  = true

  email          = "charlie@sikademo.com"
  email_verified = true
  first_name     = "Charlie"
  last_name      = "Demo"

  initial_password {
    value     = "aa"
    temporary = true
  }
}

resource "keycloak_user_groups" "charlie" {
  realm_id = keycloak_realm.example.id
  user_id  = keycloak_user.charlie.id

  group_ids = [
    keycloak_group.team-b.id,
  ]
}

resource "keycloak_user_roles" "charlie" {
  realm_id = keycloak_realm.example.id
  user_id  = keycloak_user.charlie.id

  role_ids = [
    data.keycloak_role.default.id,
    keycloak_role.editor.id,
    keycloak_role.viewer.id,
  ]
}
