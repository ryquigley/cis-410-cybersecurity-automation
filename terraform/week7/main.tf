provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_compute_network" "week7_vpc" {
  name                    = "week7-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "week7_subnet" {
  name          = "week7-subnet"
  ip_cidr_range = "10.10.0.0/24"
  region        = var.region
  network       = google_compute_network.week7_vpc.id
}

resource "google_compute_firewall" "allow_ssh" {
  name    = "week7-allow-ssh"
  network = google_compute_network.week7_vpc.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = [var.my_ip_cidr]
}
