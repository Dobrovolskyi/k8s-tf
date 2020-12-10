data "google_container_cluster" "hillel" {
  name     = var.name
  location = var.location
}

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
      type = "RollingUpdate"
      rolling_update {
        max_surge       = 1
        max_unavailable = 0
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
          port {
            container_port = 80
          }

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
