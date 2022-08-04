terraform {
  required_providers {
    aws = {
      version = ">= 3.63"
      source  = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "eu-south-1"
}

module "users" {
  source     = "../../../modules/iam/users"
  user_names = var.user_names
}
