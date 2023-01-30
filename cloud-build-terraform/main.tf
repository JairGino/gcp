terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }

   backend "gcs" {
    bucket  = "${var.bucket_name}"
    prefix  = "terraform/state"
  }
  
}

provider "google" {
  project = "${var.project_id}"
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
  allow_stopping_for_update = true

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

resource "google_cloudbuild_trigger" "filename-trigger" {
  name = "node-example-npm"
  description = "Trigger do Nodejs exemplo"
  location = "us-central1"

  trigger_template {
    branch_name = "main"
    repo_name   = "${var.remote_repository}"
  }

  substitutions = {
    _FOO = "bar"
    _BAZ = "qux"
  }

  filename = "${var.filename_path}"
}