terraform {
  required_version = ">= 0.12"
}

provider "google" {
  version = "3.48.0"
  project = "theta-signal-294917"
  region  = "europe-west1"
  zone    = "europe-west1-b"
}

provider "kubernetes" {
  load_config_file = false
  host             = "google_container_cluster.${var.name}.endpoint"
  token            = data.google_client_config.default.access_token

  client_certificate     = base64decode("google_container_cluster.${var.name}.master_auth[0].client_certificate")
  client_key             = base64decode("google_container_cluster.${var.name}.master_auth[0].client_key")
  cluster_ca_certificate = base64decode("google_container_cluster.${var.name}.master_auth[0].cluster_ca_certificate")
}
