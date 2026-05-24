terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 7.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_artifact_registry_repository" "flask_repo" {
  location      = var.region
  repository_id = "flask-app-repo"
  description   = "Artifact Registry repo for Flask app"
  format        = "DOCKER"
}

resource "google_cloud_run_v2_service" "flask_service" {
  name     = "cis410-flask-app"
  location = var.region

  template {
    containers {
      image = "us-central1-docker.pkg.dev/${var.project_id}flask-app-repo/flask-app:v1"

      ports {
        container_port = 5000
      }
    }
  }

  deletion_protection = false

  depends_on = [
    google_artifact_registry_repository.flask_repo
  ]
}

resource "google_cloud_run_service_iam_member" "public_access" {
  service  = google_cloud_run_v2_service.flask_service.name
  location = google_cloud_run_v2_service.flask_service.location
  role     = "roles/run.invoker"
  member   = "allUsers"
}
