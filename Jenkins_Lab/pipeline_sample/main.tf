provider "google" {
  credentials = "${file("/opt/gcp/service-account.json")}"
  project = "testingpjct-dev"
  region = "us-central1"
  zone = "us-central1-c"
}
resource "google_storage_bucket" "my_bucket" {
  name          = var.bucket_name
  location      = "us-central1"
  force_destroy = true
}
