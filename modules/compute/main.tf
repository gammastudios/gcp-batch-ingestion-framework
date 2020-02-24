
locals {
  network = "kubernetes-the-hard-way-${element(split("-", var.subnet), 0)}"
}

resource "google_compute_address" "external_with_subnet_and_address" {
  name         = "kubernetes-the-hard-way-${var.env}"
  region       = "us-west1"
}

resource "google_compute_instance" "compute_kubernetes_control_plane" {
  count           = 2 # down to two because of quota on free trial Compute Engine API In-use IP addresses
  name            = "controller-${count.index}"
  zone            = "us-west1-a"
  machine_type    = "n1-standard-1"
  can_ip_forward  = true
  
  tags = ["kubernetes-the-hard-way-dev", "controller"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
      size = "200"
    }
  }

  network_interface {
    network = "${local.network}"
    network_ip = "10.240.0.1${count.index}"
    subnetwork = "${var.env}-subnet-01"
    access_config { } # without this nodes don't get external ip and cannot reach the Internet
  }

  service_account {
    scopes = ["compute-rw","storage-ro","service-management","service-control","logging-write","monitoring"]
  }
}

resource "google_compute_instance" "compute_kubernetes_workers" {
  count           = 2 # down to two because of quota on free trial Compute Engine API In-use IP addresses
  name            = "worker-${count.index}"
  zone            = "us-west1-a"
  machine_type    = "n1-standard-1"
  can_ip_forward  = true
  
  tags = ["kubernetes-the-hard-way-dev", "worker"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
      size = "200"
    }
  }

  network_interface {
    network = "${local.network}"
    network_ip = "10.240.0.2${count.index}"
    subnetwork = "${var.env}-subnet-01"
    access_config { } # without this nodes don't get external ip and cannot reach the Internet
  }

  service_account {
    scopes = ["compute-rw","storage-ro","service-management","service-control","logging-write","monitoring"]
  }
  metadata = {
    pod-cidr = "10.240.0.2${count.index}"
  }  
}
