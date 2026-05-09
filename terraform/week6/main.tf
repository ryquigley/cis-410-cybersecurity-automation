terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
    random = {
      source = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

resource "random_id" "suffix" {
  byte_length = 4
}

resource "google_storage_bucket" "bucket1" {
  name          = "${var.project_id}-bucket1-${random_id.suffix.hex}"
  location      = "US"
  force_destroy = true
  uniform_bucket_level_access = true
}

resource "google_storage_bucket" "bucket2" {
  name          = "${var.project_id}-bucket2-${random_id.suffix.hex}"
  location      = "US"
  force_destroy = true
  uniform_bucket_level_access = true
}
