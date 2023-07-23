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
  default     = ""
}

variable "flow_log_cloudwatch_log_group_retention_in_days" {
  description = "The number of days to retain log events in the specified log group for VPC flow logs"
  type        = number
  default     = null
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
  default     = []
}

variable "eks_cluster_private_subnets" {
  description = "Private subnets for the EKS cluster"
  type        = list(string)
  default     = []
}

##################################################
# OUTPUTS
##################################################

output "vpc_id" {
  value = module.vpc.vpc_id
}


