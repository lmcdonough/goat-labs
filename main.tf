terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0.0"
    }
    vpc = {
      source  = "hashicorp/vpc"
      version = ">= 2.0.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# import the vpc module
module "vpc" {
  source = "./modules/vpc"

}
