terraform {
  required_version = ">= 1.0.0"

  #backend "pg" {}

  backend "s3" {
    bucket = "terraform-state-7ac65cd8-518c-40db-99a7-8948133592ca"
    key    = "dev/us-east-1/eks/terraform.tfstate"
    region = "us-east-1"
    #dynamodb_table = "terraform_state"
    profile = "personal"
  }

  required_providers {
    aws = { version = "3.58.0" }
    kubernetes = { version = "2.3.1" }
  }

}

provider "aws" {
  region = var.region
  profile = "personal"
  default_tags {
    tags = {
      environment = var.environment
    }
  }
}
