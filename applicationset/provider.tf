provider "argocd" {
  server   = "localhost:8084"
  username = var.argocd_username
  password = var.argocd_password
}
