resource "aws_vpc" "main" {
  cidr_block = var.vpc.cidr
  tags       = merge(local.tags, map("Name", "${local.system_prefix}-vpc"))
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags   = merge(local.tags, map("Name", "${local.system_prefix}-igw"))
}