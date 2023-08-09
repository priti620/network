resource "google_compute_firewall" "fw-1" {
  name    = "allow-only-gke-cluster"
  network = google_compute_network.vpc.name

  allow {
    protocol = "tcp"
    ports    = ["3306"]
  }

  priority = 1000

  source_ranges = ["10.10.10.0/24"]
}

resource "google_compute_firewall" "fw-2" {
  name    = "allow-only-authorized-networks"
  network = google_compute_network.vpc.name

  allow {
    protocol = "tcp"
  }

  priority = 1000

  source_ranges = ["10.10.20.0/24"]
}
