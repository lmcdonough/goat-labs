terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# import the vpc module
module "vpc" {
  source  = "./modules/vpc"
  version = "5.1.0"

}
