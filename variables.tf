variable "name" {
  default = "devops-course-cluster"
}

variable "project" {
  default = "theta-signal-294917"
}

variable "location" {
  region = "europe-west1"
  zone   = "europe-west1-b"
}

variable "initial_node_count" {
  default = 3
}

variable "machine_type" {
  default = "e2-standard-2"
}
