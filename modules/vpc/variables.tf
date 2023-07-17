variable "vpc_name" {
  default     = "tf-vpc"
  description = "The name of the VPC"
}

variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "The CIDR block for the VPC"
}

variable "vpc_azs" {
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
  description = "The availability zones for the VPC"
}

variable "vpc_private_subnets" {
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  description = "The private subnets for the VPC"
}

variable "vpc_public_subnets" {
  default     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  description = "The public subnets for the VPC"
}

variable "enable_nat_gateway" {
  default     = true
  description = "Enable NAT Gateway"
}

variable "enable_vpn_gateway" {
  default     = true
  description = "Enable VPN Gateway"
}

variable "terraform_tag" {
  default     = "true"
  description = "Tag for Terraform"
}

variable "environment_tag" {
  default     = "dev"
  description = "Tag for Environment"
}

##################################################
# OUTPUTS
##################################################

output "vpc_id" {
  value = module.vpc.vpc_id
}


