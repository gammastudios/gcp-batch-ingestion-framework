
locals {
  network = "kubernetes-the-hard-way-${element(split("-", var.subnet), 0)}"
}

resource "google_compute_firewall" "kubernetes-the-hard-way-allow-internal" {
  name    = "${local.network}-internal"
  network = "${local.network}"
  project = "${var.project}"

  allow {
    protocol = "tcp"
  }

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "udp"
  }  

  source_ranges = ["10.240.0.0/24","10.200.0.0/16"]
}

resource "google_compute_firewall" "kubernetes-the-hard-way-allow-external" {
  name    = "${local.network}-external"
  network = "${local.network}"
  project = "${var.project}"

  allow {
    protocol = "tcp"
    ports    = ["22", "6433"]
  }

  allow {
    protocol = "icmp"
  }  
  source_ranges = ["0.0.0.0/0"]
}
