
module "vpc" {
  source  = "terraform-google-modules/network/google"
  version = "0.6.0"

  project_id   = "${var.project}"
  network_name = "kubernetes-the-hard-way-${var.env}"

  subnets = [
    {
      subnet_name   = "${var.env}-subnet-01"
      subnet_ip     = "10.${var.env == "dev" ? 240 : 230}.0.0/24"
      subnet_region = "us-west1"
    },
  ]

  secondary_ranges = {
    "${var.env}-subnet-01" = []
  }
}
