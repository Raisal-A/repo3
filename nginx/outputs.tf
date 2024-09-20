output "nginx_service" {
  value = kubernetes_service.nginx.metadata[0].name
}
