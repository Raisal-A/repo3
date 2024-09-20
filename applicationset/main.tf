resource "argocd_applicationset" "example" {
  metadata {
    name      = "my-applicationset"
    namespace = "argocd"
  }

  spec {
    generators {
      list {
        elements {
          name      = "alb-app"
          namespace = "production/alb"
        }
      }
      list {
        elements {
          name      = "ecr-app"
          namespace = "production/ecr"
        }
      }
      list {
        elements {
          name      = "eks-app"
          namespace = "production/eks"
        }
      }
    }

    template {
      metadata {
        name      = "{{name}}"
        namespace = "{{namespace}}"
      }

      spec {
        project = "default"
        source {
          repoURL        = "https://github.com/Raisal-A/repo3.git"
          chart          = "my-chart"
          targetRevision = "main"
        }

        destination {
          server = "https://kubernetes.default.svc"
          namespace = "{{namespace}}"
        }

        syncPolicy {
          automated {
            prune    = true
            selfHeal = true
          }
        }
      }
    }
  }
}
