resource "keycloak_user" "bob" {
  lifecycle {
    ignore_changes = [ required_actions, federated_identity ]
  }

  realm_id = keycloak_realm.example.id
  username = "bob"
  enabled  = true

  email          = "bob@sikademo.com"
  email_verified = true
  first_name     = "Bob"
  last_name      = "Demo"

  initial_password {
    value     = "aa"
    temporary = true
  }
}

resource "keycloak_user_groups" "bob" {
  realm_id = keycloak_realm.example.id
  user_id  = keycloak_user.bob.id

  group_ids = [
    keycloak_group.team-a.id,
    keycloak_group.grafana-admin.id,
    keycloak_group.argocd-readonly.id,
    keycloak_group.editors.id,
    keycloak_group.viewers.id,
  ]
}

resource "keycloak_user_roles" "bob" {
  realm_id = keycloak_realm.example.id
  user_id  = keycloak_user.bob.id

  role_ids = [
    data.keycloak_role.default.id,
    keycloak_role.editor.id,
    keycloak_role.viewer.id,
  ]
}
