terraform {
  required_version = ">= 1.0.0"

  #backend "pg" {}

  backend "s3" {
    bucket = "terraform-state-7ac65cd8-518c-40db-99a7-8948133592ca"
    key    = "dev/us-east-1/network/terraform.tfstate"
    region = "us-east-1"
    #dynamodb_table = "terraform_state"
    profile = "personal"
  }

  required_providers {
    aws = { version = "3.58.0" }
  }

}

provider "aws" {
  profile = "personal"
  region = "us-east-1"
  default_tags {
    tags = {
      environment = var.environment
    }
  }
}
