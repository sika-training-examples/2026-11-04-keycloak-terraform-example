resource "keycloak_openid_client" "grafana" {
  realm_id                        = keycloak_realm.example.id
  client_id                       = "grafana"
  client_secret                   = "grafana"
  enabled                         = true
  access_type                     = "CONFIDENTIAL"
  standard_flow_enabled           = true
  direct_access_grants_enabled    = true
  oauth2_device_authorization_grant_enabled = true
  valid_redirect_uris             = [
    "http://209.38.225.240:3333/*",
  ]
  valid_post_logout_redirect_uris = [
    "http://209.38.225.240:3333/*",
  ]
  web_origins                     = [
    "http://209.38.225.240:3333/*",
  ]
}

resource "keycloak_openid_client_default_scopes" "grafana" {
  realm_id  = keycloak_realm.example.id
  client_id = keycloak_openid_client.grafana.id
  default_scopes = [
    "profile",
    "email",
    keycloak_openid_client_scope.example_groups.name,
  ]
}

resource "keycloak_openid_client_optional_scopes" "grafana" {
  realm_id  = keycloak_realm.example.id
  client_id = keycloak_openid_client.grafana.id

  optional_scopes = []
}
