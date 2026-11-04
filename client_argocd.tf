resource "keycloak_openid_client" "argocd" {
  realm_id                        = keycloak_realm.example.id
  client_id                       = "argocd"
  client_secret                   = "argocd"
  enabled                         = true
  access_type                     = "CONFIDENTIAL"
  standard_flow_enabled           = true
  direct_access_grants_enabled    = true
  oauth2_device_authorization_grant_enabled = true
  valid_redirect_uris             = [
    "https://argocd.k8s.sikademo.com/*",
  ]
  valid_post_logout_redirect_uris = [
    "https://argocd.k8s.sikademo.com/*",
  ]
  web_origins                     = [
    "https://argocd.k8s.sikademo.com/*",
  ]
}

resource "keycloak_openid_client_default_scopes" "argocd" {
  realm_id  = keycloak_realm.example.id
  client_id = keycloak_openid_client.argocd.id
  default_scopes = [
    "profile",
    "email",
    keycloak_openid_client_scope.example_groups.name,
  ]
}

resource "keycloak_openid_client_optional_scopes" "argocd" {
  realm_id  = keycloak_realm.example.id
  client_id = keycloak_openid_client.argocd.id

  optional_scopes = []
}
