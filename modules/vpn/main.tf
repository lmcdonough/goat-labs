#  name:vpn.tf

# Define the VPN
resource "aws_vpn_gateway" "my_vpn_gateway" {
  vpc_id = aws_vpc.my_vpc.id
}

# Define the VPN connection
resource "aws_vpn_connection" "my_vpn_connection" {
  vpn_gateway_id      = aws_vpn_gateway.my_vpn_gateway.id
  customer_gateway_id = aws_customer_gateway.my_customer_gateway.id
  type                = "ipsec.1"
  static_routes_only  = true

  tunnel1 {
    pre_shared_key      = var.vpn_pre_shared_key
    tunnel_inside_cidr  = var.vpn_tunnel_inside_cidr1
    tunnel_outside_cidr = var.vpn_tunnel_outside_cidr1
  }

  tunnel2 {
    pre_shared_key      = var.vpn_pre_shared_key
    tunnel_inside_cidr  = var.vpn_tunnel_inside_cidr2
    tunnel_outside_cidr = var.vpn_tunnel_outside_cidr2
  }
}

# Define the customer gateway
resource "aws_customer_gateway" "my_customer_gateway" {
  bgp_asn    = var.vpn_bgp_asn
  ip_address = var.vpn_ip_address
  type       = "ipsec.1"
}

# Define the VPN route
resource "aws_route" "my_vpn_route" {
  route_table_id         = aws_route_table.my_route_table.id
  destination_cidr_block = var.vpn_destination_cidr_block
  gateway_id             = aws_vpn_gateway.my_vpn_gateway.id
}

# Define the VPN route table association
resource "aws_route_table_association" "my_vpn_route_table_association" {
  subnet_id      = aws_subnet.my_subnet.id
  route_table_id = aws_route_table.my_route_table.id
}

# Define the VPN route table
resource "aws_route_table" "my_route_table" {
  vpc_id = aws_vpc.my_vpc.id
}

# Define the VPN security group
resource "aws_security_group" "my_vpn_security_group" {
  vpc_id = aws_vpc.my_vpc.id
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Define the VPN security group rule
resource "aws_security_group_rule" "my_vpn_security_group_rule" {
  security_group_id = aws_security_group.my_vpn_security_group.id
  protocol          = "-1"
  from_port         = 0
  to_port           = 0
  cidr_blocks       = ["0.0.0.0/0"]
}
