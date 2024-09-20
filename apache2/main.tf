resource "kubernetes_namespace" "apache2" {
  metadata {
    name = var.namespace
  }
}

resource "kubernetes_deployment" "apache2" {
  metadata {
    name      = "apache2"
    namespace = kubernetes_namespace.apache2.metadata[0].name
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "apache2"
      }
    }
    template {
      metadata {
        labels = {
          app = "apache2"
        }
      }
      spec {
        container {
          name  = "apache2"
          image = "httpd:latest"
        }
      }
    }
  }
}

resource "kubernetes_service" "apache2" {
  metadata {
    name      = "apache2"
    namespace = kubernetes_namespace.apache2.metadata[0].name
  }

  spec {
    selector = {
      app = "apache2"
    }
    port {
      port        = 80
      target_port = 80
    }
    type = "ClusterIP"
  }
}
