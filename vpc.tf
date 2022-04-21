resource "aws_vpc" "main" {
  cidr_block           = var.vpc.cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags                 = merge(local.tags, map("Name", "${local.system_prefix}-vpc"))
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags   = merge(local.tags, map("Name", "${local.system_prefix}-igw"))
}

resource "aws_default_route_table" "main" {
  default_route_table_id = aws_vpc.main.main_route_table_id
  tags                   = merge(local.tags, map("Name", "${local.system_prefix}-rtb-default"))
}

resource "aws_route" "default_igw" {
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
  route_table_id         = aws_default_route_table.main.id
}

resource "aws_vpc_endpoint" "ssm" {
  vpc_id              = aws_vpc.main.id
  service_name        = "com.amazonaws.${var.region.name}.ssm"
  vpc_endpoint_type   = "Interface"
  subnet_ids          = [aws_subnet.protected_a.id, aws_subnet.protected_c.id]
  security_group_ids  = [aws_security_group.vpce.id]
  private_dns_enabled = true
  tags                = merge(local.tags, { Name = "${local.system_prefix}-vpce-ssm" })
}

resource "aws_vpc_endpoint" "ec2messages" {
  vpc_id              = aws_vpc.main.id
  service_name        = "com.amazonaws.${var.region.name}.ec2messages"
  vpc_endpoint_type   = "Interface"
  subnet_ids          = [aws_subnet.protected_a.id, aws_subnet.protected_c.id]
  security_group_ids  = [aws_security_group.vpce.id]
  private_dns_enabled = true
  tags                = merge(local.tags, { Name = "${local.system_prefix}-vpce-ec2messages" })
}

resource "aws_vpc_endpoint" "ssmmessages" {
  vpc_id              = aws_vpc.main.id
  service_name        = "com.amazonaws.${var.region.name}.ssmmessages"
  vpc_endpoint_type   = "Interface"
  subnet_ids          = [aws_subnet.protected_a.id, aws_subnet.protected_c.id]
  security_group_ids  = [aws_security_group.vpce.id]
  private_dns_enabled = true
  tags                = merge(local.tags, { Name = "${local.system_prefix}-vpce-ssmmessages" })
}