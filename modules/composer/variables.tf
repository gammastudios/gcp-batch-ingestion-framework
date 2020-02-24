
variable "google_project_id" {
  description = "GCP project name"
  default = "gamma-ingestion"
}

variable "name" {
  description = "Cloud composer instance name"
  default = "cloud-composer-tf"
}

variable "region" {
  description = "GCP compute node region"
  default = "australia-southeast1"
}

variable "zone" {
  description= "GCP compute zone"
  default = "australia-southeast1-a"
}

variable "machine_type" {
  description = "GCP node machine type"
  default = "n1-standard-2"
}

//variable "email" {
//  description ="Airflow alert mail address"
//  default = "nothing@nothing.com"
//}

//variable "sendgrid_api_key" {
//  description = "API key for sendgrid"
//}

variable "oauth_scopes" {
  type = "list"
  description = "Oauth scopes for GCP compute nodes"
  default = ["https://www.googleapis.com/auth/cloud-platform",
    "https://www.googleapis.com/auth/pubsub",
    "https://www.googleapis.com/auth/datastore",
    "https://www.googleapis.com/auth/bigquery",
    "https://www.googleapis.com/auth/devstorage.read_write",
    "https://www.googleapis.com/auth/logging.write",
  ]
}

variable "airflow_config_overrides" {
  description = "Airflow configuration over-rides"
  type = "map"

  default = {
    core-max_active_runs_per_dag = "60"
    core-dag_concurrency         = "30"
    core-parallelism             = "60"
    celery-celeryd_concurrency   = "10"
  }
}

variable "pypi_packages" {
  type = "map"

  default = {
    google-cloud-bigquery = "==0.26.0"
    google-cloud-core     = "==0.26.0"
    google-cloud-storage  = "==1.3.2"
  }
}

