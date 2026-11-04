resource "keycloak_openid_client" "example2" {
  realm_id                        = keycloak_realm.example.id
  client_id                       = "example2"
  enabled                         = true
  access_type                     = "CONFIDENTIAL"
  standard_flow_enabled           = true
  direct_access_grants_enabled    = true
  pkce_code_challenge_method      = "S256"
  valid_redirect_uris             = ["*"]
  valid_post_logout_redirect_uris = ["*"]
  web_origins                     = ["*"]
}

output "client_secret_example2" {
  value = keycloak_openid_client.example2.client_secret
  sensitive = true
}


resource "keycloak_openid_client_default_scopes" "example2" {
  realm_id  = keycloak_realm.example.id
  client_id = keycloak_openid_client.example2.id
  default_scopes = [
    "profile",
    "email",
  ]
}

resource "keycloak_openid_client_optional_scopes" "example2" {
  realm_id  = keycloak_realm.example.id
  client_id = keycloak_openid_client.example2.id

  optional_scopes = []
}
