terraform {
 backend "gcs" {
   bucket  = "piumhi10terraform"
   prefix  = "terraform/state"
 }
}
