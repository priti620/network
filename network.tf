resource "google_compute_network" "vpc" {
  name                    = "vpc-tfe"
  auto_create_subnetworks = "false" 
  routing_mode            = "GLOBAL"
}

resource "google_compute_subnetwork" "subnet-1" {
  name          = "subnet-1"
  ip_cidr_range = "10.10.10.0/24"
  network       = google_compute_network.vpc.id
  region        = var.region

  secondary_ip_range  = [
    {
        range_name    = "test-1"
        ip_cidr_range = "10.10.11.0/24"
    },
    {
        range_name    = "test-2"
        ip_cidr_range = "10.1.0.0/20"
    }
  ]

  private_ip_google_access = true
}

resource "google_compute_subnetwork" "subnet-2" {
  name          = "subnet-1"
  ip_cidr_range = "10.20.10.0/24"
  network       = google_compute_network.vpc.id
  region        = var.region

  private_ip_google_access = true
}
