variable "project_id" {
  description = "GCP Project ID"
  type        = string
  default     = "cis410-ryan-496413"
}

variable "region" {
  description = "Deployment region"
  type        = string
  default     = "us-central1"
}

variable "my_ip_cidr" {
  description = "Your public IP for SSH access"
  type        = string
}
