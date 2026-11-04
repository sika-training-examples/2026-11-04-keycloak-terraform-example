resource "keycloak_openid_client" "example_public" {
  realm_id                        = keycloak_realm.example.id
  client_id                       = "example_public"
  enabled                         = true
  access_type                     = "PUBLIC"
  standard_flow_enabled           = true
  direct_access_grants_enabled    = true
  pkce_code_challenge_method      = "S256"
  valid_redirect_uris             = ["*"]
  valid_post_logout_redirect_uris = ["*"]
  web_origins                     = ["*"]
}
