resource "keycloak_openid_client" "sa_viewer" {
  realm_id                 = keycloak_realm.example.id
  client_id                = "sa_viewer"
  client_secret            = "sa_viewer_secret"
  access_type              = "CONFIDENTIAL"
  service_accounts_enabled = true
}

resource "keycloak_openid_client_service_account_realm_role" "sa_viewer" {
  for_each = toset([
    keycloak_role.viewer.name,
  ])

  realm_id                = keycloak_realm.example.id
  service_account_user_id = keycloak_openid_client.sa_viewer.service_account_user_id
  role                    = each.key
}
