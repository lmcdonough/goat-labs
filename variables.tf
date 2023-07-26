variable "aws_region" {
  description = "The AWS region"
  type        = string
  default     = "us-east-1"
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
  default     = "us-east-1a"
}

variable "tf_eks_iam_role" {
  description = "The name of the IAM role for Terraform"
  type        = string
  default     = "tf_eks_iam_role_name"
}

variable "ipv6_cidr_block" {
  description = "The IPv6 CIDR block for the VPC"
  type        = string
  default     = ""
}

variable "enable_flow_logs" {
  description = "Enable VPC flow logs"
  type        = bool
  default     = true
}

variable "flow_log_destination_type" {
  description = "The destination type for VPC flow logs"
  type        = string
  default     = "cloud-watch-logs"
}

variable "flow_log_destination_arn" {
  description = "The ARN of the CloudWatch log group for VPC flow logs"
  type        = string
  default     = ""
}

variable "create_flow_log_cloudwatch_log_group" {
  description = "Create a CloudWatch log group for VPC flow logs"
  type        = bool
  default     = true
}

variable "create_flow_log_cloudwatch_iam_role" {
  description = "Create an IAM role for VPC flow logs"
  type        = bool
  default     = true
}

variable "flow_log_cloudwatch_iam_role_arn" {
  description = "The ARN for the IAM role used to post flow logs to a CloudWatch Logs log group"
  type        = string
  default     = ""
}

variable "flow_log_cloudwatch_log_group_name_prefix" {
  description = "The name prefix of CloudWatch Log Group for VPC flow logs"
  type        = string
  default     = "/aws/vpc-flow-log/"
}

variable "flow_log_cloudwatch_log_group_name_suffix" {
  description = "The name suffix of CloudWatch Log Group for VPC flow logs"
  type        = string
  default     = "tf-vpcaws"
}

variable "flow_log_cloudwatch_log_group_retention_in_days" {
  description = "The number of days to retain log events in the specified log group for VPC flow logs"
  type        = number
  default     = 1
}

variable "flow_log_cloudwatch_log_group_kms_key_id" {
  description = "The ARN of the KMS Key to use when encrypting log data for VPC flow logs"
  type        = string
  default     = null
}

variable "enable_vpc_endpoints" {
  description = "Enable VPC endpoints for S3 and RDS"
  type        = bool
  default     = true
}

variable "vpc_endpoint_s3" {
  description = "Enable VPC endpoint for S3"
  type        = bool
  default     = true
}

variable "vpc_endpoint_rds" {
  description = "Enable VPC endpoint for RDS"
  type        = bool
  default     = true
}

variable "enable_highly_available_public_subnets" {
  description = "Enable highly available public subnets for ingress to an EKS cluster deployed to private subnets"
  type        = bool
  default     = true
}

variable "public_subnet_availability_zones" {
  description = "Availability zones for the highly available public subnets"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "eks_cluster_private_subnets" {
  description = "Private subnets for the EKS cluster"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
  default     = "tf-vpcaws"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_azs" {
  description = "The availability zones for the VPC"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "vpc_private_subnets" {
  description = "The private subnets for the VPC"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "vpc_public_subnets" {
  description = "The public subnets for the VPC"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}

variable "enable_nat_gateway" {
  description = "Enable NAT gateway for private subnets"
  type        = bool
  default     = true
}

variable "enable_vpn_gateway" {
  description = "Enable VPN gateway for private subnets"
  type        = bool
  default     = false
}

variable "terraform_tag" {
  description = "The Terraform tag"
  type        = string
  default     = "Terraform"
}

variable "environment_tag" {
  description = "The environment tag"
  type        = string
  default     = "Dev"
}


