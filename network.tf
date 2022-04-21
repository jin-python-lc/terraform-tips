resource "aws_eip" "natgateway_a" {
  vpc  = true
  tags = merge(local.tags, map("Name", "${local.system_prefix}-ngw-a"))
}

resource "aws_eip" "natgateway_c" {
  vpc  = true
  tags = merge(local.tags, map("Name", "${local.system_prefix}-ngw-c"))
}

resource "aws_nat_gateway" "main_a" {
  allocation_id = aws_eip.natgateway_a.id
  subnet_id     = aws_subnet.public_a.id
  tags          = merge(local.tags, map("Name", "${local.system_prefix}-ngw-a"))
}

resource "aws_nat_gateway" "main_c" {
  allocation_id = aws_eip.natgateway_c.id
  subnet_id     = aws_subnet.public_c.id
  tags          = merge(local.tags, map("Name", "${local.system_prefix}-ngw-c"))
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = merge(local.tags, map("Name", "${local.system_prefix}-rtb-pub"))
}

resource "aws_route_table" "protected_a" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main_a.id
  }
  tags = merge(local.tags, map("Name", "${local.system_prefix}-rtb-prt-a"))
}

resource "aws_route_table" "protected_c" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main_c.id
  }
  tags = merge(local.tags, map("Name", "${local.system_prefix}-rtb-prt-c"))
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
  tags   = merge(local.tags, map("Name", "${local.system_prefix}-rtb-prv"))
}

resource "aws_route_table_association" "public_a" {
  route_table_id = aws_route_table.public.id
  subnet_id      = aws_subnet.public_a.id
}

resource "aws_route_table_association" "public_c" {
  route_table_id = aws_route_table.public.id
  subnet_id      = aws_subnet.public_c.id
}

resource "aws_route_table_association" "protected_a" {
  route_table_id = aws_route_table.protected_a.id
  subnet_id      = aws_subnet.protected_a.id
}

resource "aws_route_table_association" "protected_c" {
  route_table_id = aws_route_table.protected_c.id
  subnet_id      = aws_subnet.protected_c.id
}

resource "aws_route_table_association" "private_a" {
  route_table_id = aws_route_table.private.id
  subnet_id      = aws_subnet.private_a.id
}

resource "aws_route_table_association" "private_c" {
  route_table_id = aws_route_table.private.id
  subnet_id      = aws_subnet.private_c.id
}

resource "aws_network_acl" "public" {
  vpc_id     = aws_vpc.main.id
  subnet_ids = [aws_subnet.public_a.id, aws_subnet.public_c.id]
  ingress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
  egress {
    protocol   = -1
    rule_no    = 101
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
  tags = merge(local.tags, map("Name", "${local.system_prefix}-acl-pub"))
}

resource "aws_network_acl" "protected_a" {
  vpc_id     = aws_vpc.main.id
  subnet_ids = [aws_subnet.protected_a.id]
  ingress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
  egress {
    protocol   = -1
    rule_no    = 101
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
  tags = merge(local.tags, map("Name", "${local.system_prefix}-acl-prt-a"))
}

resource "aws_network_acl" "protected_c" {
  vpc_id     = aws_vpc.main.id
  subnet_ids = [aws_subnet.protected_c.id]
  ingress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
  egress {
    protocol   = -1
    rule_no    = 101
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
  tags = merge(local.tags, map("Name", "${local.system_prefix}-acl-prt-c"))
}

resource "aws_network_acl" "private_a" {
  vpc_id     = aws_vpc.main.id
  subnet_ids = [aws_subnet.private_a.id]
  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = aws_subnet.protected_a.cidr_block
    from_port  = 3306
    to_port    = 3306
  }
  egress {
    protocol   = "tcp"
    rule_no    = 101
    action     = "allow"
    cidr_block = aws_subnet.protected_a.cidr_block
    from_port  = 3306
    to_port    = 3306
  }
  tags = merge(local.tags, map("Name", "${local.system_prefix}-acl-prv-a"))
}

resource "aws_network_acl" "private_c" {
  vpc_id     = aws_vpc.main.id
  subnet_ids = [aws_subnet.private_c.id]
  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = aws_subnet.protected_c.cidr_block
    from_port  = 3306
    to_port    = 3306
  }
  egress {
    protocol   = "tcp"
    rule_no    = 101
    action     = "allow"
    cidr_block = aws_subnet.protected_c.cidr_block
    from_port  = 3306
    to_port    = 3306
  }
  tags = merge(local.tags, map("Name", "${local.system_prefix}-acl-prv-c"))
}