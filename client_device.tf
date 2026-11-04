resource "keycloak_openid_client" "device" {
  realm_id                        = keycloak_realm.example.id
  client_id                       = "device"
  client_secret                   = "device_secret"
  enabled                         = true
  access_type                     = "CONFIDENTIAL"
  standard_flow_enabled           = true
  direct_access_grants_enabled    = true
  oauth2_device_authorization_grant_enabled = true
  valid_redirect_uris             = ["*"]
  valid_post_logout_redirect_uris = ["*"]
  web_origins                     = ["*"]
}
