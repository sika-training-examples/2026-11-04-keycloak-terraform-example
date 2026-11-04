resource "keycloak_role" "editor" {
  realm_id = keycloak_realm.example.id
  name     = "editor"
}

resource "keycloak_role" "viewer" {
  realm_id = keycloak_realm.example.id
  name     = "viewer"
}
