# Define the CloudWatch log group for the EKS cluster
resource "aws_cloudwatch_log_group" "eks_log_group" {
  name              = "/aws/eks/my-eks-cluster"
  retention_in_days = 30
}

# Define the CloudWatch log group for the Lambda function
resource "aws_cloudwatch_log_group" "lambda_log_group" {
  name              = "/aws/lambda/my-lambda-function"
  retention_in_days = 30
}

# Define the CloudWatch log group for the Flask application
resource "aws_cloudwatch_log_group" "flask_app_log_group" {
  name              = "/aws/eks/flask-app"
  retention_in_days = 30
}

# Define the CloudWatch log group for the ArgoCD
resource "aws_cloudwatch_log_group" "argocd_log_group" {
  name              = "/aws/eks/argocd"
  retention_in_days = 30
}

# Define the CloudWatch log group for the Helm charts
resource "aws_cloudwatch_log_group" "helm_charts_log_group" {
  name              = "/aws/eks/helm-charts"
  retention_in_days = 30
}

# Define the CloudWatch log group for the VPC
resource "aws_cloudwatch_log_group" "vpc_log_group" {
  name              = "/aws/eks/vpc"
  retention_in_days = 30
}

# Define the CloudWatch log group for the VPN
resource "aws_cloudwatch_log_group" "vpn_log_group" {
  name              = "/aws/eks/vpn"
  retention_in_days = 30
}

# Define the CloudWatch log group for the logging module
resource "aws_cloudwatch_log_group" "logging_log_group" {
  name              = "/aws/eks/logging"
  retention_in_days = 30
}

# Define the CloudWatch log group for the monitoring module
resource "aws_cloudwatch_log_group" "monitoring_log_group" {
  name              = "/aws/eks/monitoring"
  retention_in_days = 30
}

# Define the CloudWatch log group for the alerting module
resource "aws_cloudwatch_log_group" "alerting_log_group" {
  name              = "/aws/eks/alerting"
  retention_in_days = 30
}

# Define the CloudWatch log group for the SRE module
resource "aws_cloudwatch_log_group" "sre_log_group" {
  name              = "/aws/eks/sre"
  retention_in_days = 30
}

# Define the CloudWatch log group for the security module
resource "aws_cloudwatch_log_group" "security_log_group" {
  name              = "/aws/eks/security"
  retention_in_days = 30
}

# Define the CloudWatch log group for the Vault
resource "aws_cloudwatch_log_group" "vault_log_group" {
  name              = "/aws/eks/vault"
  retention_in_days = 30
}

# Define the CloudWatch log group for the IAM
resource "aws_cloudwatch_log_group" "iam_log_group" {
  name              = "/aws/eks/iam"
  retention_in_days = 30
}
