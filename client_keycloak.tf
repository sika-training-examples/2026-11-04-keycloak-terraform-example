resource "keycloak_openid_client" "keycloak" {
  realm_id                        = keycloak_realm.example.id
  client_id                       = "keycloak"
  client_secret                   = "keycloak"
  enabled                         = true
  access_type                     = "CONFIDENTIAL"
  standard_flow_enabled           = true
  direct_access_grants_enabled    = true
  oauth2_device_authorization_grant_enabled = true
  valid_redirect_uris             = [
    "https://keycloak.lab0.sikademo.com/realms/demo/broker/example/endpoint",
  ]
  valid_post_logout_redirect_uris = [
    "https://keycloak.lab0.sikademo.com/*",
  ]
  web_origins                     = [
    "https://keycloak.lab0.sikademo.com/*",
  ]
}

resource "keycloak_openid_client_default_scopes" "keycloak" {
  realm_id  = keycloak_realm.example.id
  client_id = keycloak_openid_client.keycloak.id
  default_scopes = [
    "profile",
    "email",
    keycloak_openid_client_scope.example_groups.name,
  ]
}

resource "keycloak_openid_client_optional_scopes" "keycloak" {
  realm_id  = keycloak_realm.example.id
  client_id = keycloak_openid_client.keycloak.id

  optional_scopes = []
}
