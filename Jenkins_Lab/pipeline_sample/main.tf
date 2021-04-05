provider "google" {
  credentials = "${SVC_ACCOUNT_KEY}"
  project = "testingpjct-dev"
  region = "us-central1"
  zone = "us-central1-c"
}
resource "google_storage_bucket" "my_bucket" {
  name          = var.bucket_name
  location      = "us-central1"
  force_destroy = true
}
