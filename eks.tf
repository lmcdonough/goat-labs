# Define the EKS cluster
resource "aws_eks_cluster" "my_eks_cluster" {
  name     = "my-eks-cluster"
  role_arn = aws_iam_role.my_eks_role.arn
  vpc_config {
    subnet_ids = [aws_subnet.my_subnet.id]
  }
}

# Define the IAM role for EKS
resource "aws_iam_role" "my_eks_role" {
  name = "my-eks-role"
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

# Define the IAM role policy for EKS
resource "aws_iam_role_policy" "my_eks_role_policy" {
  name   = "my-eks-role-policy"
  role   = aws_iam_role.my_eks_role.id
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
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
        "ec2:CreateSubnet",
        "ec2:DeleteSubnet",
        "ec2:CreateVpc",
        "ec2:DeleteVpc",
        "ec2:CreateNetworkInterface",
        "ec2:DeleteNetworkInterface",
        "ec2:CreateNetworkInterfacePermission",
        "ec2:DeleteNetworkInterfacePermission",
        "ec2:DeleteRouteTable",
        "ec2:CreateDhcpOptions",
        "ec2:DeleteDhcpOptions",
        "ec2:CreateVpnGateway",
        "ec2:DeleteVpnGateway",
        "ec2:AttachVpnGateway",
        "ec2:DetachVpnGateway",
        "ec2:CreateCustomerGateway",
        "ec2:DeleteCustomerGateway",
        "ec2:CreateVpnConnection",
        "ec2:DeleteVpnConnection",
        "ec2:CreateVpnConnectionRoute",
        "ec2:DeleteVpnConnectionRoute",
        "ec2:CreateVpcEndpoint",
        "ec2:DeleteVpcEndpoint",
        "ec2:CreateVpcEndpointServiceConfiguration",
        "ec2:DeleteVpcEndpointServiceConfiguration",
        "ec2:CreateVpcPeeringConnection",
        "ec2:DeleteVpcPeeringConnection",
        "ec2:CreateFlowLog",
        "ec2:DeleteFlowLog",
        "ec2:CreateEgressOnlyInternetGateway",
        "ec2:DeleteEgressOnlyInternetGateway",
        "ec2:CreateManagedPrefixList",
        "ec2:DeleteManagedPrefixList",
        "ec2:CreateTransitGateway",
        "ec2:DeleteTransitGateway",
        "ec2:CreateTransitGatewayRouteTable",
        "ec2:DeleteTransitGatewayRouteTable",
        "ec2:CreateTransitGatewayRoute",
        "ec2:DeleteTransitGatewayRoute",
        "ec2:CreateTransitGatewayMulticastDomain",
        "ec2:DeleteTransitGatewayMulticastDomain",
        "ec2:CreateTransitGatewayPeeringAttachment",
        "ec2:DeleteTransitGatewayPeeringAttachment",
        "ec2:CreateTransitGatewayConnect",
        "ec2:DeleteTransitGatewayConnect",
        "ec2:CreateTransitGatewayConnectPeer",
        "ec2:DeleteTransitGatewayConnectPeer",
        "ec2:CreateTransitGatewayMulticastGroup",
        "ec2:DeleteTransitGatewayMulticastGroup",
        "ec2:CreateTransitGatewayMulticastGroupSources",
        "ec2:DeleteTransitGatewayMulticastGroupSources",
        "ec2:CreateTransitGatewayMulticastGroupMembers",
        "ec2:DeleteTransitGatewayMulticastGroupMembers",
        "ec2:CreateTransitGatewayRouteTableAssociation",
        "ec2:DeleteTransitGatewayRouteTableAssociation",
        "ec2:CreateTransitGatewayRouteTablePropagation",
        "ec2:DeleteTransitGatewayRouteTablePropagation",
        "ec2:CreateTransitGatewayVpcAttachment",
        "ec2:DeleteTransitGatewayVpcAttachment",
        "ec2:CreateTransitGatewayVpcAttachmentAccepter",
        "ec2:DeleteTransitGatewayVpcAttachmentAccepter",
        "ec2:CreateTransitGatewayPeeringAttachmentAccepter",
        "ec2:DeleteTransitGatewayPeeringAttachmentAccepter",
        "ec2:CreateTransitGatewayMulticastDomainAssociation",
        "ec2:DeleteTransitGatewayMulticastDomainAssociation"

      ]
    }
  ]

    }
    EOF
}
