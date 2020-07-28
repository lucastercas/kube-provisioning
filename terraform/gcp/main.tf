variable "project_name" {
  value = "kubernetes_test"
}

variable "region" {
  value = "us-central1"
}

resource "random_id" "project_id" {
  byte_length = 4
  prefix      = var.project_name
}

resource "google_project" "project" {
  name            = var.project_name
  project_id      = random_id.project_id.hex
  billing_account = var.billing_account
}

provider "google" {
  credential = file("credentials.json")
  project    = "kubernetes-test-1"
  region     = var.region
  zone       = "us-central1-c"
}

resource "google_compute_instance" "controlplane" {
  name         = "controlplane"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debial-cloud/debian-9"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.self_link
    access_config {}
  }
}

resource "google_compute_network" "vpc_network" {
  name                    = "network"
  auto_create_subnetworks = true
}
