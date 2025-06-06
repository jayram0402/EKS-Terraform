terraform {
  required_version = ">= 1.12.1"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70" # Compatible with Terraform 0.12–1.3 approx.
    }
  }
  backend "s3" {
    bucket         = "dev-jay-tf-bucket"
    region         = "ap-southeast-1"
    key            = "eks/terraform.tfstate"
    dynamodb_table = "Lock-Files"
    encrypt        = true
  }
}

provider "aws" {
  region  = var.aws-region
}
