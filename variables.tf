variable "aws_region" {
  description = "The AWS region"
  type        = string
  default     = "us-west-2"
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_block" {
  description = "The CIDR block for the subnet"
  type        = string
  default     = "10.0.0.0/24"
}

variable "availability_zone" {
  description = "The availability zone for the subnet"
  type        = string
  default     = "us-west-2a"
}

variable "tf_eks_iam_role" {
  description = "The name of the IAM role for Terraform"
  type        = string
  default     = "tf_eks_iam_role_name"
}
