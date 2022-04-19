resource "aws_security_group" "alb_web" {
  name        = "${local.system_prefix}-alb-web-sg"
  description = "${local.system_prefix}-alb-web-sg"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
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
    protocol    = "-1"
    security_groups = [aws_security_group.maintenance.id]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.tags, map("Name", "${local.system_prefix}-ec2-web"))
}

resource "aws_security_group" "maintenance" {
  name        = "${local.system_prefix}-ec2-maintenance-sg"
  description = "${local.system_prefix}-ec2-maintenance-sg"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.tags, map("Name", "${local.system_prefix}-ec2-maintenance"))
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