data "keycloak_role" "default" {
  realm_id = keycloak_realm.example.id
  name     = "default-roles-example"
}
