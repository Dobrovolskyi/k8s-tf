resource "google_container_cluster" "hillel" {
  name        = var.name
  project     = var.project
  description = "DevOps course GKE Cluster"
  location    = var.location

  remove_default_node_pool = true
  initial_node_count       = var.initial_node_count
}

resource "google_container_node_pool" "hillel-node-pool" {
  name       = "${var.name}-node-pool"
  project    = var.project
  location   = var.location
  cluster    = google_container_cluster.hillel.name
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = var.machine_type

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}
