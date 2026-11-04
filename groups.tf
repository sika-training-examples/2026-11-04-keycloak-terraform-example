resource "keycloak_group" "team-a" {
  realm_id = keycloak_realm.example.id
  name     = "team-a"
}

resource "keycloak_group" "team-b" {
  realm_id = keycloak_realm.example.id
  name     = "team-b"
}

resource "keycloak_group" "grafana-admin" {
  realm_id = keycloak_realm.example.id
  name     = "grafana-admin"
}

resource "keycloak_group" "argocd-admin" {
  realm_id = keycloak_realm.example.id
  name     = "argocd-admin"
}

resource "keycloak_group" "argocd-readonly" {
  realm_id = keycloak_realm.example.id
  name     = "argocd-readonly"
}

resource "keycloak_group" "admins" {
  realm_id = keycloak_realm.example.id
  name     = "admins"
}

resource "keycloak_group" "editors" {
  realm_id = keycloak_realm.example.id
  name     = "editors"
}

resource "keycloak_group" "viewers" {
  realm_id = keycloak_realm.example.id
  name     = "viewers"
}
