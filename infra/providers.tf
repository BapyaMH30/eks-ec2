terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.87"
    }
  }
  required_version = ">= 1.5.0"
}

provider "aws" {
  region  = var.aws_region
  profile = "bapyamh30" //if commented will pull default credentials from env or ~/.aws/credentials

  default_tags {
    tags = {
      Owner = "Terraform"
    }
  }
}