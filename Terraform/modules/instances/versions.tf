terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.11.0"
    }
  }
}

provider "google" {
  project   = "bucket-project-410808"
  region    = "us-central1"
}