terraform {
  backend "s3" {
    bucket  = "terraform-state-tcoleman"
    profile = "default"
    region  = "us-east-1"
  }
}
