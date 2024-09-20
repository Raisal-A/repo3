output "apache2_service" {
  value = kubernetes_service.apache2.metadata[0].name
}
