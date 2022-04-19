resource "aws_vpc" "main" {
  cidr_block = var.vpc.cidr
  tags       = merge(local.tags, map("Name", "${local.system_prefix}-vpc"))
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags   = merge(local.tags, map("Name", "${local.system_prefix}-igw"))
}

resource "aws_default_route_table" "main" {
  default_route_table_id = aws_vpc.main.main_route_table_id
  tags                   = merge(local.tags, map("Name", "${local.system_prefix}-rtb"))
}