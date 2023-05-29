terraform {
  backend "s3" {
    bucket  = "terraform-state-tcoleman"
    profile = "default"
    region  = "us-east-1"

    dynamodb_table = "terraform-locks"
    encrypt        = true
  }

  #   backend "remote" {
  #     hostname     = "app.terraform.io"
  #     organization = "tcoleman-org"
  #     workspaces {
  #       name = "test-aws-app"
  #     }
  #   }
}

