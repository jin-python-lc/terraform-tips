## tfvars
```tf:ap-northeast-1.tfvars
aws = {
  account_id     = 535401992203
}
region = {
  name       = "ap-northeast-1"
  short_name = "apnorth1"
}
project = {
  name = "terraform-tips"
}
stage = {
  name       = "develop"
  short_name = "dev"
}
vpc = {
  cidr = "192.0.0.0/16"
}
subnet = {
  public_a = {
    cidr = "192.0.0.0/27"
  }
  public_c = {
    cidr = "192.0.0.32/27"
  }
  protected_a = {
    cidr = "192.0.0.64/27"
  }
  protected_c = {
    cidr = "192.0.0.96/27"
  }
  private_a = {
    cidr = "192.0.0.128/27"
  }
  private_c = {
    cidr = "192.0.0.160/27"
  }
}
health_check_path = "/index.html"
web_access_src_cidr = [
  "0.0.0.0/0"
]
ec2 = {
  ami_id             = "ami-0a3d21ec6281df8cb"
  http_port          = 80
  web_count          = 2
  web_instance_type  = "t2.micro"
  web_volume_size    = 30
}
rds_instance_type = "db.t3.small"
rds = {
  username = "TerraformLocal"
  password = "PassWord0000"
}

alb_rules = [
  {
    name                                     = "AWS-AWSManagedRulesKnownBadInputsRuleSet"
    priority                                 = 0
    version                                  = null
    override_action_none                     = ["true"]
    override_action_count                    = [] 
    managed_rule_group_statement_name        = "AWSManagedRulesKnownBadInputsRuleSet"
    managed_rule_group_statement_vendor_name = "AWS"
    metric_name                              = "AWSManagedRulesKnownBadInputsRuleSet"
    excluded_rule                            = []
  },
  {
    name                                     = "AWS-AWSManagedRulesUnixRuleSet"
    priority                                 = 1
    version                                  = null
    override_action_none                     = ["true"]
    override_action_count                    = []
    managed_rule_group_statement_name        = "AWSManagedRulesUnixRuleSet"
    managed_rule_group_statement_vendor_name = "AWS"
    metric_name                              = "AWSManagedRulesUnixRuleSet"
    excluded_rule                            = []
  },
  {
    name                                     = "AWS-AWSManagedRulesSQLiRuleSet"
    priority                                 = 2
    version                                  = null
    override_action_none                     = ["true"]
    override_action_count                    = [] 
    managed_rule_group_statement_name        = "AWSManagedRulesSQLiRuleSet"
    managed_rule_group_statement_vendor_name = "AWS"
    metric_name                              = "AWSManagedRulesSQLiRuleSet"
    excluded_rule                            = []
  },
  {
    name                                     = "AWS-AWSManagedRulesAdminProtectionRuleSet"
    priority                                 = 3
    version                                  = null
    override_action_none                     = ["true"]
    override_action_count                    = []
    managed_rule_group_statement_name        = "AWSManagedRulesAdminProtectionRuleSet"
    managed_rule_group_statement_vendor_name = "AWS"
    metric_name                              = "AWSManagedRulesAdminProtectionRuleSet"
    excluded_rule                            = []
  },
  {
    name                                     = "AWS-AWSManagedRulesCommonRuleSet"
    priority                                 = 4
    version                                  = null
    override_action_none                     = ["true"]
    override_action_count                    = [] 
    managed_rule_group_statement_name        = "AWSManagedRulesCommonRuleSet"
    managed_rule_group_statement_vendor_name = "AWS"
    metric_name                              = "AWSManagedRulesCommonRuleSet"
    excluded_rule                            = []
  },
]
```

## variable.tf
```tf:variable.tf
variable "aws" { type = map(any) }
variable "region" { type = map(any) }
variable "project" { type = map(any) }
variable "stage" { type = map(any) }
variable "vpc" { type = map(any) }
variable "subnet" { type = map(any) }
variable "health_check_path" { type = string }
variable "web_access_src_cidr" { type = list(any) }
variable "ec2" { type = map(any) }
variable "rds_instance_type" { type = string }
variable "rds" { type = map(any) }
variable "alb_rules" {
  type = list(object({
    name                                     = string
    priority                                 = number
    version                                  = string
    override_action_none                     = list(string)
    override_action_count                    = list(string)
    managed_rule_group_statement_name        = string
    managed_rule_group_statement_vendor_name = string
    metric_name                              = string
    excluded_rule                            = list(string)
  }))
}
```

## locals.tf
```tf:locals.tf
locals {
  system_prefix = "${var.project.name}-${var.stage.short_name}"
  tags = {
    Env     = var.stage.name
    Stage   = var.stage.name
    Project = var.stage.name
  }
  protected_subnets = {
    "0" = aws_subnet.protected_a.id
    "1" = aws_subnet.protected_c.id
  }
  bucket = "tfstates-depot-bucket-poc"
}
```

## terraform.tf
```tf:terraform.tf
terraform {
  required_version = "~> 0.14.6"

  required_providers {
    aws = {
      version = "~> 4.0.0"
      source  = "hashicorp/aws"
    }
    time = {
      version = "~> 0.7.1"
      source  = "hashicorp/time"
    }
  }

  backend "s3" {}
}
```

## provider.tf
```tf:provider.tf
provider "aws" {
  region  = var.region.name
  profile = "terraform@local2"
}

/* provider "aws" {
  region = var.region.name
  # codebuildにアタッチされているRoleをAdmin相当Roleの信頼関係に追加する
  # またはcodebuildにアタッチされているRoleにAdminポリシーを付与する
  assume_role {
    role_arn     = "arn:aws:iam::${var.aws.account_id}:role/AdminForTerraform"
    session_name = "aws"
  }
} */
```

## vpc.tf
```tf:vpc.tf
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
```

## subnet.tf
```tf:subnet.tf
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
```

## network.tf
```tf:network.tf
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
```

## security_group.tf
```tf:security_group.tf
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
```

## wafv2.tf
```tf:wafv2.tf
resource "aws_wafv2_web_acl" "alb" {
  name        = "${var.project.name}-webacl-${var.stage.short_name}"
  description = "${var.project.name}-webacl-${var.stage.short_name}"
  scope       = "REGIONAL"

  default_action {
    allow {}
  }

  dynamic "rule" {
    for_each = toset(var.alb_rules)

    content {
      name     = rule.value.name
      priority = rule.value.priority
      override_action {
        dynamic "none" {
          for_each = rule.value.override_action_none
          content {}
        }
        dynamic "count" {
          for_each = rule.value.override_action_count
          content {}
        }
      }
      statement {
        managed_rule_group_statement {
          name        = rule.value.managed_rule_group_statement_name
          vendor_name = rule.value.managed_rule_group_statement_vendor_name
          version     = rule.value.version
          dynamic "excluded_rule" {
            for_each = rule.value.excluded_rule
            content {
              name = excluded_rule.value
            }
          }
        }
      }
      visibility_config {
        cloudwatch_metrics_enabled = true
        metric_name                = rule.value.metric_name
        sampled_requests_enabled   = true
      }
    }
  }

  tags = merge(local.tags, map("Name", "${local.system_prefix}-webacl"))

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "${var.project.name}-webacl-${var.stage.short_name}"
    sampled_requests_enabled   = true
  }
}

resource "aws_wafv2_web_acl_association" "web_alb" {
  resource_arn = aws_lb.web.arn
  web_acl_arn  = aws_wafv2_web_acl.alb.arn
}
```

## alb.tf
```tf:alb.tf
resource "aws_lb" "web" {
  name                             = "${local.system_prefix}-alb-web"
  internal                         = false
  load_balancer_type               = "application"
  subnets                          = [aws_subnet.public_a.id, aws_subnet.public_c.id]
  security_groups                  = [aws_security_group.alb_web.id]
  enable_deletion_protection       = false
  enable_cross_zone_load_balancing = true
  access_logs {
    bucket  = local.bucket
    prefix  = "ALBLog"
    enabled = true
  }

  tags = merge(local.tags, map("Name", "${local.system_prefix}-alb-web"))
}

resource "aws_lb_listener" "web_http" {
  load_balancer_arn = aws_lb.web.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ec2_web.arn
  }
}

resource "aws_lb_listener_rule" "forward" {
  listener_arn = aws_lb_listener.web_http.arn
  priority     = 99

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ec2_web.arn
  }

  condition {
    path_pattern {
      values = ["/*"]
    }
  }
}

resource "aws_lb_target_group" "ec2_web" {
  name        = "${local.system_prefix}-tg-ec2-web"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = aws_vpc.main.id
  tags        = merge(local.tags, map("Name", "${local.system_prefix}-tg-ec2-web"))
  health_check {
    protocol = "HTTP"
    path     = var.health_check_path
  }
}

resource "aws_alb_target_group_attachment" "alb_web" {
  count            = var.ec2.web_count
  target_group_arn = aws_lb_target_group.ec2_web.arn
  target_id        = aws_instance.web[count.index].id
  port             = 80
}

output "web_alb_fqdn" {
  value = aws_lb.web.dns_name
}
```

## ec2.tf
```tf:ec2.tf
resource "aws_instance" "web" {
  count                       = var.ec2.web_count
  ami                         = var.ec2.ami_id
  instance_type               = var.ec2.web_instance_type
  subnet_id                   = local.protected_subnets[count.index % 2]
  associate_public_ip_address = false
  vpc_security_group_ids      = [aws_security_group.ec2_web.id]
  iam_instance_profile        = aws_iam_instance_profile.systems_manager.name
  user_data                   = <<EOF
  #!/bin/bash
  yum update -y
  yum install -y httpd
  systemctl start httpd
  systemctl enable httpd
  echo `hostname` > /var/www/html/index.html
  EOF
  root_block_device {
    volume_type           = "gp3"
    volume_size           = var.ec2.web_volume_size
    delete_on_termination = true
  }
  tags = merge(local.tags, map("Name", "${local.system_prefix}-ec2-web-${format("%02d", count.index + 1)}"))
  lifecycle {
    ignore_changes = [
      ami
    ]
  }
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "role" {
  name               = "SSMRole"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "aws_iam_policy" "systems_manager" {
  arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_policy" "ssmpolicy" {
  name        = "ssmpolicy"
  path        = "/"
  description = "ssmpolicy"

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "ssmmessages:CreateControlChannel",
          "ssmmessages:CreateDataChannel",
          "ssmmessages:OpenControlChannel",
          "ssmmessages:OpenDataChannel"
        ],
        "Resource" : "*"
      },
      {
        "Effect" : "Allow",
        "Action" : [
          "s3:GetEncryptionConfiguration"
        ],
        "Resource" : "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "default" {
  role       = aws_iam_role.role.name
  policy_arn = data.aws_iam_policy.systems_manager.arn
}

resource "aws_iam_role_policy_attachment" "default2" {
  role       = aws_iam_role.role.name
  policy_arn = aws_iam_policy.ssmpolicy.arn
}

resource "aws_iam_instance_profile" "systems_manager" {
  name = "MyInstanceProfile"
  role = aws_iam_role.role.name
}
```

## rds.tf
```tf:rds.tf
resource "aws_db_subnet_group" "db_subnetg" {
  name = "${local.system_prefix}-db-subnetg"
  subnet_ids = [aws_subnet.private_a.id, aws_subnet.private_c.id]

  tags = merge(local.tags, map("Name", "${local.system_prefix}-db-subnetg"))
}

resource "aws_db_parameter_group" "db_param" {
  name   = "${local.system_prefix}-rds-pg"
  family = "aurora-mysql5.7"

  tags = merge(local.tags, map("Name", "${local.system_prefix}-rds-pg"))
}

resource "aws_rds_cluster_parameter_group" "db_cluster_param" {
  name    = "${local.system_prefix}-rds-cpg"
  family  = "aurora-mysql5.7"

  parameter {
    name  = "character_set_database"
    value = "utf8"
  }

  parameter {
    name  = "character_set_server"
    value = "utf8"
  }

  parameter {
    name  = "collation_server"
    value = "utf8_general_ci"
  }

  parameter {
    name  = "log_bin_trust_function_creators"
    value = "1"
  }

  parameter {
    name  = "time_zone"
    value = "Asia/Tokyo"
  }

  tags    = merge(local.tags, map("Name", "${local.system_prefix}-rds-clu-pg"))
}

resource "aws_rds_cluster" "db_cluster" {
  cluster_identifier              = "${local.system_prefix}-rds"
  master_username                 = var.rds.username
  master_password                 = var.rds.password
  backup_retention_period         = 7
  preferred_backup_window         = "19:30-20:00"
  preferred_maintenance_window    = "tue:20:15-tue:20:45"
  port                            = 3306
  vpc_security_group_ids          = [aws_security_group.rds.id]
  db_subnet_group_name            = aws_db_subnet_group.db_subnetg.name
  storage_encrypted               = true
  db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.db_cluster_param.name
  copy_tags_to_snapshot           = true
  engine_version                  = "5.7.mysql_aurora.2.09.2"
  engine                          = "aurora-mysql"
  skip_final_snapshot             = true

  tags = merge(local.tags, map("Name", "${local.system_prefix}-rds-cluster"))
}

resource "aws_rds_cluster_instance" "db_add" {
  count                      = var.stage.short_name == "prd" ? 1 : 0
  identifier                 = "${local.system_prefix}-rds-${format("%02d", count.index + 1)}"
  cluster_identifier         = aws_rds_cluster.db_cluster.id
  instance_class             = var.rds_instance_type
  engine_version             = "5.7.mysql_aurora.2.09.2"
  engine                     = "aurora-mysql"
  auto_minor_version_upgrade = false
  db_parameter_group_name    = aws_db_parameter_group.db_param.name

  tags = merge(local.tags, map("Name", "${local.system_prefix}-rds-${format("%02d", count.index + 1)}"))
}



output "aurora_endpint" {
  value = aws_rds_cluster.db_cluster.endpoint
}
output "aurora_reader_endpint" {
  value = aws_rds_cluster.db_cluster.reader_endpoint
}
```

