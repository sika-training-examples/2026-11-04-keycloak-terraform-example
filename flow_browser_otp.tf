resource "keycloak_authentication_flow" "browser_otp" {
  realm_id    = keycloak_realm.example.id
  alias       = "browser-otp"
  description = "Browser flow with mandatory OTP"
}

resource "keycloak_authentication_execution" "browser_otp_cookie" {
  realm_id          = keycloak_realm.example.id
  parent_flow_alias = keycloak_authentication_flow.browser_otp.alias
  authenticator     = "auth-cookie"
  requirement       = "ALTERNATIVE"
}

resource "keycloak_authentication_execution" "browser_otp_idp_redirector" {
  realm_id          = keycloak_realm.example.id
  parent_flow_alias = keycloak_authentication_flow.browser_otp.alias
  authenticator     = "identity-provider-redirector"
  requirement       = "ALTERNATIVE"

  depends_on = [
    keycloak_authentication_execution.browser_otp_cookie,
  ]
}

resource "keycloak_authentication_subflow" "browser_otp_forms" {
  realm_id          = keycloak_realm.example.id
  parent_flow_alias = keycloak_authentication_flow.browser_otp.alias
  alias             = "browser-otp-forms"
  provider_id       = "basic-flow"
  requirement       = "ALTERNATIVE"

  depends_on = [
    keycloak_authentication_execution.browser_otp_idp_redirector,
  ]
}

resource "keycloak_authentication_execution" "browser_otp_username_password" {
  realm_id          = keycloak_realm.example.id
  parent_flow_alias = keycloak_authentication_subflow.browser_otp_forms.alias
  authenticator     = "auth-username-password-form"
  requirement       = "REQUIRED"
}

resource "keycloak_authentication_execution" "browser_otp_otp" {
  realm_id          = keycloak_realm.example.id
  parent_flow_alias = keycloak_authentication_subflow.browser_otp_forms.alias
  authenticator     = "auth-otp-form"
  requirement       = "REQUIRED"

  depends_on = [
    keycloak_authentication_execution.browser_otp_username_password,
  ]
}

resource "keycloak_authentication_bindings" "example" {
  realm_id     = keycloak_realm.example.id
  browser_flow = keycloak_authentication_flow.browser_otp.alias

  depends_on = [
    keycloak_authentication_execution.browser_otp_otp,
  ]
}
