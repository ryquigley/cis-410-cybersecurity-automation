output "vpc_name" {
  value = google_compute_network.week7_vpc.name
}

output "subnet_name" {
  value = google_compute_subnetwork.week7_subnet.name
}

output "firewall_rule" {
  value = google_compute_firewall.allow_ssh.name
}
