resource "aws_security_group" "alb_web" {
  name        = "${local.system_prefix}-alb-web-sg"
  description = "${local.system_prefix}-alb-web-sg"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = var.ec2.http_port
    to_port     = var.ec2.http_port
    protocol    = "tcp"
    cidr_blocks = var.web_access_src_cidr
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.tags, map("Name", "${local.system_prefix}-alb"))
}

resource "aws_security_group" "ec2_web" {
  name        = "${local.system_prefix}-ec2-web-sg"
  description = "${local.system_prefix}-ec2-web-sg"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port       = var.ec2.http_port
    to_port         = var.ec2.http_port
    protocol        = "tcp"
    security_groups = [aws_security_group.alb_web.id]
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = [aws_subnet.public_a.cidr_block, aws_subnet.public_c.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.tags, map("Name", "${local.system_prefix}-ec2-web"))
}

resource "aws_security_group" "rds" {
  name        = "${local.system_prefix}-rds-sg"
  description = "${local.system_prefix}-rds-sg"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.ec2_web.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.tags, map("Name", "${local.system_prefix}-rds-sg"))
}

resource "aws_security_group" "vpce" {
  name        = "${local.system_prefix}-ec2-vpce-sg"
  description = "${local.system_prefix}-ec2-vpce-sg"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [aws_subnet.protected_a.cidr_block, aws_subnet.protected_c.cidr_block]
  }

  tags = merge(local.tags, map("Name", "${local.system_prefix}-ec2-vpce"))
}