terraform {
  backend "gcs" {
    bucket = "gamma-ingestion-tfstate"
    prefix = "env/master"
  }
}