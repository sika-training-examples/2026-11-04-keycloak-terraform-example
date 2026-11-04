resource "keycloak_realm" "example" {
  realm                  = "example"
  enabled                = true
  display_name           = "Example SSO"
  password_policy = "lowerCase(1) and length(2) and forceExpiredPasswordChange(365) and notUsername"
}

resource "keycloak_openid_client_scope" "example_groups" {
  realm_id               = keycloak_realm.example.id
  name                   = "groups"
  include_in_token_scope = true
}

resource "keycloak_openid_group_membership_protocol_mapper" "example_groups" {
  realm_id        = keycloak_realm.example.id
  client_scope_id = keycloak_openid_client_scope.example_groups.id

  name            = "groups"
  claim_name      = "groups"
  full_path       = false
}

resource "keycloak_oidc_identity_provider" "example" {
  realm              = keycloak_realm.example.id
  alias              = "sikalabs-training-sso"
  display_name       = "SikaLabs Training SSO"
  client_id          = "example_client_id"
  client_secret      = "example_client_secret"
  authorization_url  = "https://sso.sikalabs.com/realms/training/protocol/openid-connect/auth"
  token_url          = "https://sso.sikalabs.com/realms/training/protocol/openid-connect/token"
  user_info_url      = "https://sso.sikalabs.com/realms/training/protocol/openid-connect/userinfo"
  logout_url         = "https://sso.sikalabs.com/realms/training/protocol/openid-connect/logout"
  jwks_url           = "https://sso.sikalabs.com/realms/training/protocol/openid-connect/certs"
  issuer             = "https://sso.sikalabs.com/realms/training"
  validate_signature = true
  default_scopes     = "openid profile email"
  trust_email        = true
  sync_mode          = "IMPORT"
  extra_config = {
    pkceEnabled = "true"
    pkceMethod  = "S256"
  }
}
