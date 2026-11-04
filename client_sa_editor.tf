resource "keycloak_openid_client" "sa_editor" {
  realm_id                 = keycloak_realm.example.id
  client_id                = "sa_editor"
  client_secret            = "sa_editor_secret"
  access_type              = "CONFIDENTIAL"
  service_accounts_enabled = true
}

resource "keycloak_openid_client_service_account_realm_role" "sa_editor" {
  for_each = toset([
    keycloak_role.editor.name,
  ])

  realm_id                = keycloak_realm.example.id
  service_account_user_id = keycloak_openid_client.sa_editor.service_account_user_id
  role                    = each.key
}
