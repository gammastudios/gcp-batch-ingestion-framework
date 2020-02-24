// TODO:
// - Enable Beta Features
// - Determine if we'd like to use emails as notifications, would need to set up SendGrid.
// - Configure Composer bucket names as per our standard
// - Put in a wait when enabling the API's; it timed out previously
// - Try and remember that deploying a fresh version of Composer takes a *whole* lot of time
//     -> 22 minutes and counting
// - Current code has error on apply
//      -> Error code 3, message: Failed to install PyPI packages.
// - Current code has error on destroy
//      -> Error: googleapi: got HTTP response code 404 with body: <!DOCTYPE html>
//      -> Seems to delete Composer instance, but not GKE/bucket
// - Current code probably needs some enhancements to work within a VPC

locals {
  env = "master"
}

provider "google" {
  project = "${var.project}"
  zone = "australia-southeast1-a"
}

resource "google_project_service" "project" {
  project = "${var.project}"
  service = "composer.googleapis.com"

  disable_dependent_services = true
}

module "composer" {
  source  = "../../modules/composer"
//  env     = "local.env"
}
