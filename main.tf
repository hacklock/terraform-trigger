terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
  
  resource "random_id" "bucket_prefix" {
  byte_length = 8
}


   backend "gcs" {
    bucket  = "piumhi10terraform"
    prefix  = "terraform/state"
  }
  
}

provider "google" {
  project = "piumhi10-devops-iac"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_network" "vpc_network" {
  name = "${var.network_name}"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "f1-micro"
  tags = ["prod"]

  labels = {
    centro_custo = "${var.centro_custo_rh}"
  }

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {
    }
  }
}
