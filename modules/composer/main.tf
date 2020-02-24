resource "google_composer_environment" "composer" {
  name   = "${var.name}"
  region = "${var.region}"

  // Configure airflow variables
  config {
    software_config {
      pypi_packages            = "${var.pypi_packages}"
      airflow_config_overrides = "${var.airflow_config_overrides}"

      //  Confgure env variables
//      env_variables {
//        SENDGRID_MAIL_FROM = "${var.email}"
//        SENDGRID_API_KEY   = "${var.sendgrid_api_key}"
//      }
    }

    //configure compute node variables
    node_config {
      zone         = "${var.zone}"
      machine_type = "${var.machine_type}"
      oauth_scopes = "${var.oauth_scopes}"
    }
  }
}