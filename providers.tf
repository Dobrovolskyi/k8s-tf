terraform {
  required_version = ">= 0.12"
}

provider "google" {
  version = "3.48.0"
  project = "theta-signal-294917" # "{{YOUR GCP PROJECT}}"
  region  = "europe-west1"
  zone    = "europe-west1-b"
}
