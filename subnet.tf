resource "aws_subnet" "public_a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet.public_a.cidr
  availability_zone       = "${var.region.name}a"
  map_public_ip_on_launch = true
  tags                    = merge(local.tags, map("Name", "${local.system_prefix}-sbn-pub-a"))
}

resource "aws_subnet" "public_c" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet.public_c.cidr
  availability_zone       = "${var.region.name}c"
  map_public_ip_on_launch = true
  tags                    = merge(local.tags, map("Name", "${local.system_prefix}-sbn-pub-c"))
}

resource "aws_subnet" "protected_a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet.protected_a.cidr
  availability_zone       = "${var.region.name}a"
  map_public_ip_on_launch = false
  tags                    = merge(local.tags, map("Name", "${local.system_prefix}-sbn-prt-a"))
}

resource "aws_subnet" "protected_c" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet.protected_c.cidr
  availability_zone       = "${var.region.name}c"
  map_public_ip_on_launch = false
  tags                    = merge(local.tags, map("Name", "${local.system_prefix}-sbn-prt-c"))
}

resource "aws_subnet" "private_a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet.private_a.cidr
  availability_zone       = "${var.region.name}a"
  map_public_ip_on_launch = false
  tags                    = merge(local.tags, map("Name", "${local.system_prefix}-sbn-prv-a"))
}

resource "aws_subnet" "private_c" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet.private_c.cidr
  availability_zone       = "${var.region.name}c"
  map_public_ip_on_launch = false
  tags                    = merge(local.tags, map("Name", "${local.system_prefix}-sbn-prv-c"))
}