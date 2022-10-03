terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.37.0"
    }
  }
}

provider "google" {
  # Configuration options
  project = "terraform-gcp-363115"
  region = "us-central1"
  zone = "us-central1-a"
  credentials = "mykey.json"
}

resource "google_service_account" "default" {
  account_id   = "service-account-id"
  display_name = "Service Account"
}


resource "google_dataproc_cluster" "mycluster3" {
  name     = "mycluster3"
  region   = "us-central1" 
  

  cluster_config {
    encryption_config {
      kms_key_name = "projects/terraform-gcp-363115/locations/us-central1/keyRings/keyring-example/cryptoKeys/uscentral"
    }
  }
}