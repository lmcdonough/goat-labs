# Define the provider
provider "aws" {
  region = var.aws_region
}

# Define the VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr_block
}

# Define the internet gateway
resource "aws_internet_gateway" "my_internet_gateway" {
  vpc_id = aws_vpc.my_vpc.id
}

# Define the NAT gateway
resource "aws_nat_gateway" "my_nat_gateway" {
  allocation_id = aws_eip.my_eip.id
  subnet_id     = aws_subnet.my_subnet.id
}

# Define the EIP
resource "aws_eip" "my_eip" {
  vpc = true
}

# Define the subnet
resource "aws_subnet" "my_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.subnet_cidr_block
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true
}

# Define the security group
resource "aws_security_group" "my_security_group" {
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Define the EKS cluster
resource "aws_eks_cluster" "my_eks_cluster" {
  name     = var.eks_cluster_name
  role_arn = aws_iam_role.my_iam_role.arn
  vpc_config {
    subnet_ids = [aws_subnet.my_subnet.id]
  }
}

# Define the IAM role
resource "aws_iam_role" "tf_eks_iam_role" {
  name = var.tf_eks_iam_role_name

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

# Define the IAM role policy
resource "aws_iam_role_policy" "my_iam_role_policy" {
  name   = var.iam_role_policy_name
  role   = aws_iam_role.my_iam_role.id
  policy = data.aws_iam_policy_document.my_iam_policy.json
}

# Define the IAM policy document
data "aws_iam_policy_document" "my_iam_policy" {
  statement {
    actions = [
      "ec2:Describe*",
      "ec2:CreateSecurityGroup",
      "ec2:CreateTags",
      "ec2:AuthorizeSecurityGroupIngress",
      "ec2:AuthorizeSecurityGroupEgress",
      "ec2:RevokeSecurityGroupIngress",
      "ec2:RevokeSecurityGroupEgress",
      "ec2:DeleteSecurityGroup",
      "ec2:CreateRouteTable",
      "ec2:CreateRoute",
      "ec2:ReplaceRoute",
      "ec2:DeleteRoute",
      "ec2:AssociateRouteTable",
      "ec2:DisassociateRouteTable",
      "ec2:CreateInternetGateway",
      "ec2:DeleteInternetGateway",
      "ec2:AttachInternetGateway",
      "ec2:DetachInternetGateway",
      "ec2:CreateNatGateway",
      "ec2:DeleteNatGateway",
      "ec2:CreateEgressOnlyInternetGateway",
      "ec2:DeleteEgressOnlyInternetGateway",
      "ec2:CreateSubnet",
      "ec2:DeleteSubnet",
      "ec2:CreateVpc",
      "ec2:DeleteVpc",
      "ec2:CreateVpcEndpoint",
      "ec2:DeleteVpcEndpoint",
      "ec2:CreateVpcEndpointServiceConfiguration",
      "ec2:DeleteVpcEndpointServiceConfiguration",
      "ec2:CreateVpcPeeringConnection",
      "ec2:DeleteVpcPeeringConnection",
      "ec2:CreateVpnGateway",
      "ec2:DeleteVpnGateway",
      "ec2:CreateCustomerGateway",
      "ec2:DeleteCustomerGateway",
      "ec2:CreateVpnConnection",
      "ec2:DeleteVpnConnection",
      "ec2:CreateVpnConnectionRoute",
      "ec2:DeleteVpnConnectionRoute",
      "ec2:CreateVpnConnectionRouteTable",
      "ec2:DeleteVpnConnectionRouteTable",
      "ec2:CreateVpnGatewayRoutePropagation",
      "ec2:DeleteVpnGatewayRoutePropagation",
      "ec2:CreateVpnGatewayRouteTableAssociation",
      "ec2:DeleteVpnGatewayRouteTableAssociation",
      "ec2:CreateVpnGatewayRouteTablePropagation",
      "ec2:DeleteVpnGatewayRouteTablePropagation",

    ]
  }
}