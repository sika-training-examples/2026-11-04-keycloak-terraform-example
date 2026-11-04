resource "keycloak_openid_client" "example3" {
  realm_id                        = keycloak_realm.example.id
  client_id                       = "example3"
  client_secret                   = "example_secret"
  enabled                         = true
  access_type                     = "CONFIDENTIAL"
  standard_flow_enabled           = true
  direct_access_grants_enabled    = true
  pkce_code_challenge_method      = "S256"
  valid_redirect_uris             = ["*"]
  valid_post_logout_redirect_uris = ["*"]
  web_origins                     = ["*"]
}

resource "keycloak_openid_client_default_scopes" "example3" {
  realm_id  = keycloak_realm.example.id
  client_id = keycloak_openid_client.example3.id
  default_scopes = [
    "profile",
    "email",
    keycloak_openid_client_scope.example_groups.name,
  ]
}

resource "keycloak_openid_client_optional_scopes" "example3" {
  realm_id  = keycloak_realm.example.id
  client_id = keycloak_openid_client.example3.id

  optional_scopes = []
}
