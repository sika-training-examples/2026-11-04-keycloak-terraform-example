resource "keycloak_openid_client" "oauth2_proxy" {
  realm_id                        = keycloak_realm.example.id
  client_id                       = "oauth2_proxy"
  client_secret                   = "oauth2_proxy"
  enabled                         = true
  access_type                     = "CONFIDENTIAL"
  standard_flow_enabled           = true
  direct_access_grants_enabled    = true
  oauth2_device_authorization_grant_enabled = true
  valid_redirect_uris             = [
    "https://oauth2-proxy-lab0.k8s.sikademo.com/oauth2/callback",
  ]
  valid_post_logout_redirect_uris = [
    "https://oauth2-proxy-lab0.k8s.sikademo.com/*",
  ]
  web_origins                     = [
    "https://oauth2-proxy-lab0.k8s.sikademo.com/*",
  ]
}

resource "keycloak_openid_client_default_scopes" "oauth2_proxy" {
  realm_id  = keycloak_realm.example.id
  client_id = keycloak_openid_client.oauth2_proxy.id
  default_scopes = [
    "profile",
    "email",
    keycloak_openid_client_scope.example_groups.name,
  ]
}

resource "keycloak_openid_client_optional_scopes" "oauth2_proxy" {
  realm_id  = keycloak_realm.example.id
  client_id = keycloak_openid_client.oauth2_proxy.id

  optional_scopes = []
}
