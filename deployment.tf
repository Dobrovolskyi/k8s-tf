resource "kubernetes_deployment" "nginxdeploy" {
  metadata {
    name = "nginxdeploy"
    labels = {
      environment = "test"
    }
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        environment = "test"
      }
    }

    strategy {
      type = RollingUpdate
      rollingUpdate {
        maxSurge       = 1
        maxUnavailable = 0
      }
    }

    template {
      metadata {
        labels = {
          environment = "test"
        }
      }

      spec {
        container {
          image = "nginx:1.18.0"
          name  = "nginx"

          liveness_probe {
            http_get {
              path = "/nginx_status"
              port = 80

              http_header {
                name  = "X-Custom-Header"
                value = "Awesome"
              }
            }

            initial_delay_seconds = 3
            period_seconds        = 10
          }
        }
      }
    }
  }
}
