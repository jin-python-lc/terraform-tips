# Diagram
![a](https://user-images.githubusercontent.com/85344890/164376863-9c2501f0-212b-4b5c-a9f4-10438992df5e.jpg)
![diagram](https://user-images.githubusercontent.com/85344890/164381403-b94285f9-e540-4f78-923b-6776c933ff30.jpg)

# Plan
```
An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_alb_target_group_attachment.alb_web[0] will be created
  + resource "aws_alb_target_group_attachment" "alb_web" {
      + id               = (known after apply)
      + port             = 80
      + target_group_arn = (known after apply)
      + target_id        = (known after apply)
    }

  # aws_alb_target_group_attachment.alb_web[1] will be created
  + resource "aws_alb_target_group_attachment" "alb_web" {
      + id               = (known after apply)
      + port             = 80
      + target_group_arn = (known after apply)
      + target_id        = (known after apply)
    }

  # aws_db_parameter_group.db_param will be created
  + resource "aws_db_parameter_group" "db_param" {
      + arn         = (known after apply)
      + description = "Managed by Terraform"
      + family      = "aurora-mysql5.7"
      + id          = (known after apply)
      + name        = "terraform-tips-dev-rds-pg"
      + name_prefix = (known after apply)
      + tags        = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-rds-pg"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + tags_all    = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-rds-pg"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
    }

  # aws_db_subnet_group.db_subnetg will be created
  + resource "aws_db_subnet_group" "db_subnetg" {
      + arn         = (known after apply)
      + description = "Managed by Terraform"
      + id          = (known after apply)
      + name        = "terraform-tips-dev-db-subnetg"
      + name_prefix = (known after apply)
      + subnet_ids  = (known after apply)
      + tags        = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-db-subnetg"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + tags_all    = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-db-subnetg"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
    }

  # aws_default_route_table.main will be created
  + resource "aws_default_route_table" "main" {
      + arn                    = (known after apply)
      + default_route_table_id = (known after apply)
      + id                     = (known after apply)
      + owner_id               = (known after apply)
      + route                  = (known after apply)
      + tags                   = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-rtb-default"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + tags_all               = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-rtb-default"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + vpc_id                 = (known after apply)
    }

  # aws_eip.natgateway_a will be created
  + resource "aws_eip" "natgateway_a" {
      + allocation_id        = (known after apply)
      + association_id       = (known after apply)
      + carrier_ip           = (known after apply)
      + customer_owned_ip    = (known after apply)
      + domain               = (known after apply)
      + id                   = (known after apply)
      + instance             = (known after apply)
      + network_border_group = (known after apply)
      + network_interface    = (known after apply)
      + private_dns          = (known after apply)
      + private_ip           = (known after apply)
      + public_dns           = (known after apply)
      + public_ip            = (known after apply)
      + public_ipv4_pool     = (known after apply)
      + tags                 = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-ngw-a"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + tags_all             = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-ngw-a"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + vpc                  = true
    }

  # aws_eip.natgateway_c will be created
  + resource "aws_eip" "natgateway_c" {
      + allocation_id        = (known after apply)
      + association_id       = (known after apply)
      + carrier_ip           = (known after apply)
      + customer_owned_ip    = (known after apply)
      + domain               = (known after apply)
      + id                   = (known after apply)
      + instance             = (known after apply)
      + network_border_group = (known after apply)
      + network_interface    = (known after apply)
      + private_dns          = (known after apply)
      + private_ip           = (known after apply)
      + public_dns           = (known after apply)
      + public_ip            = (known after apply)
      + public_ipv4_pool     = (known after apply)
      + tags                 = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-ngw-c"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + tags_all             = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-ngw-c"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + vpc                  = true
    }

  # aws_iam_instance_profile.systems_manager will be created
  + resource "aws_iam_instance_profile" "systems_manager" {
      + arn         = (known after apply)
      + create_date = (known after apply)
      + id          = (known after apply)
      + name        = "MyInstanceProfile"
      + path        = "/"
      + role        = "SSMRole"
      + tags_all    = (known after apply)
      + unique_id   = (known after apply)
    }

  # aws_iam_policy.ssmpolicy will be created
  + resource "aws_iam_policy" "ssmpolicy" {
      + arn         = (known after apply)
      + description = "ssmpolicy"
      + id          = (known after apply)
      + name        = "ssmpolicy"
      + path        = "/"
      + policy      = jsonencode(
            {
              + Statement = [
                  + {
                      + Action   = [
                          + "ssmmessages:CreateControlChannel",
                          + "ssmmessages:CreateDataChannel",
                          + "ssmmessages:OpenControlChannel",
                          + "ssmmessages:OpenDataChannel",
                        ]
                      + Effect   = "Allow"
                      + Resource = "*"
                    },
                  + {
                      + Action   = [
                          + "s3:GetEncryptionConfiguration",
                        ]
                      + Effect   = "Allow"
                      + Resource = "*"
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + policy_id   = (known after apply)
      + tags_all    = (known after apply)
    }

  # aws_iam_role.role will be created
  + resource "aws_iam_role" "role" {
      + arn                   = (known after apply)
      + assume_role_policy    = jsonencode(
            {
              + Statement = [
                  + {
                      + Action    = "sts:AssumeRole"
                      + Effect    = "Allow"
                      + Principal = {
                          + Service = "ec2.amazonaws.com"
                        }
                      + Sid       = ""
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + create_date           = (known after apply)
      + force_detach_policies = false
      + id                    = (known after apply)
      + managed_policy_arns   = (known after apply)
      + max_session_duration  = 3600
      + name                  = "SSMRole"
      + name_prefix           = (known after apply)
      + path                  = "/"
      + tags_all              = (known after apply)
      + unique_id             = (known after apply)

      + inline_policy {
          + name   = (known after apply)
          + policy = (known after apply)
        }
    }

  # aws_iam_role_policy_attachment.default will be created
  + resource "aws_iam_role_policy_attachment" "default" {
      + id         = (known after apply)
      + policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
      + role       = "SSMRole"
    }

  # aws_iam_role_policy_attachment.default2 will be created
  + resource "aws_iam_role_policy_attachment" "default2" {
      + id         = (known after apply)
      + policy_arn = (known after apply)
      + role       = "SSMRole"
    }

  # aws_instance.web[0] will be created
  + resource "aws_instance" "web" {
      + ami                                  = "ami-0a3d21ec6281df8cb"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = false
      + availability_zone                    = (known after apply)
      + cpu_core_count                       = (known after apply)
      + cpu_threads_per_core                 = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + iam_instance_profile                 = "MyInstanceProfile"
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t2.micro"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = (known after apply)
      + monitoring                           = (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + placement_partition_number           = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + subnet_id                            = (known after apply)
      + tags                                 = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-ec2-web-01"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + tags_all                             = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-ec2-web-01"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + tenancy                              = (known after apply)
      + user_data                            = "7b3beb7329797691e308607451b4d7307503616a"
      + user_data_base64                     = (known after apply)
      + vpc_security_group_ids               = (known after apply)

      + capacity_reservation_specification {
          + capacity_reservation_preference = (known after apply)

          + capacity_reservation_target {
              + capacity_reservation_id = (known after apply)
            }
        }

      + ebs_block_device {
          + delete_on_termination = (known after apply)
          + device_name           = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + snapshot_id           = (known after apply)
          + tags                  = (known after apply)
          + throughput            = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }

      + enclave_options {
          + enabled = (known after apply)
        }

      + ephemeral_block_device {
          + device_name  = (known after apply)
          + no_device    = (known after apply)
          + virtual_name = (known after apply)
        }

      + metadata_options {
          + http_endpoint               = (known after apply)
          + http_put_response_hop_limit = (known after apply)
          + http_tokens                 = (known after apply)
          + instance_metadata_tags      = (known after apply)
        }

      + network_interface {
          + delete_on_termination = (known after apply)
          + device_index          = (known after apply)
          + network_interface_id  = (known after apply)
        }

      + root_block_device {
          + delete_on_termination = true
          + device_name           = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + throughput            = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = 30
          + volume_type           = "gp3"
        }
    }

  # aws_instance.web[1] will be created
  + resource "aws_instance" "web" {
      + ami                                  = "ami-0a3d21ec6281df8cb"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = false
      + availability_zone                    = (known after apply)
      + cpu_core_count                       = (known after apply)
      + cpu_threads_per_core                 = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + iam_instance_profile                 = "MyInstanceProfile"
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t2.micro"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = (known after apply)
      + monitoring                           = (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + placement_partition_number           = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + subnet_id                            = (known after apply)
      + tags                                 = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-ec2-web-02"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + tags_all                             = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-ec2-web-02"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + tenancy                              = (known after apply)
      + user_data                            = "7b3beb7329797691e308607451b4d7307503616a"
      + user_data_base64                     = (known after apply)
      + vpc_security_group_ids               = (known after apply)

      + capacity_reservation_specification {
          + capacity_reservation_preference = (known after apply)

          + capacity_reservation_target {
              + capacity_reservation_id = (known after apply)
            }
        }

      + ebs_block_device {
          + delete_on_termination = (known after apply)
          + device_name           = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + snapshot_id           = (known after apply)
          + tags                  = (known after apply)
          + throughput            = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }

      + enclave_options {
          + enabled = (known after apply)
        }

      + ephemeral_block_device {
          + device_name  = (known after apply)
          + no_device    = (known after apply)
          + virtual_name = (known after apply)
        }

      + metadata_options {
          + http_endpoint               = (known after apply)
          + http_put_response_hop_limit = (known after apply)
          + http_tokens                 = (known after apply)
          + instance_metadata_tags      = (known after apply)
        }

      + network_interface {
          + delete_on_termination = (known after apply)
          + device_index          = (known after apply)
          + network_interface_id  = (known after apply)
        }

      + root_block_device {
          + delete_on_termination = true
          + device_name           = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + throughput            = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = 30
          + volume_type           = "gp3"
        }
    }

  # aws_internet_gateway.igw will be created
  + resource "aws_internet_gateway" "igw" {
      + arn      = (known after apply)
      + id       = (known after apply)
      + owner_id = (known after apply)
      + tags     = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-igw"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + tags_all = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-igw"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + vpc_id   = (known after apply)
    }

  # aws_lb.web will be created
  + resource "aws_lb" "web" {
      + arn                        = (known after apply)
      + arn_suffix                 = (known after apply)
      + desync_mitigation_mode     = "defensive"
      + dns_name                   = (known after apply)
      + drop_invalid_header_fields = false
      + enable_deletion_protection = false
      + enable_http2               = true
      + enable_waf_fail_open       = false
      + id                         = (known after apply)
      + idle_timeout               = 60
      + internal                   = false
      + ip_address_type            = (known after apply)
      + load_balancer_type         = "application"
      + name                       = "terraform-tips-dev-alb-web"
      + security_groups            = (known after apply)
      + subnets                    = (known after apply)
      + tags                       = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-alb-web"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + tags_all                   = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-alb-web"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + vpc_id                     = (known after apply)
      + zone_id                    = (known after apply)

      + access_logs {
          + bucket  = "tfstates-depot-bucket-poc"
          + enabled = true
          + prefix  = "ALBLog"
        }

      + subnet_mapping {
          + allocation_id        = (known after apply)
          + ipv6_address         = (known after apply)
          + outpost_id           = (known after apply)
          + private_ipv4_address = (known after apply)
          + subnet_id            = (known after apply)
        }
    }

  # aws_lb_listener.web_http will be created
  + resource "aws_lb_listener" "web_http" {
      + arn               = (known after apply)
      + id                = (known after apply)
      + load_balancer_arn = (known after apply)
      + port              = 80
      + protocol          = "HTTP"
      + ssl_policy        = (known after apply)
      + tags_all          = (known after apply)

      + default_action {
          + order            = (known after apply)
          + target_group_arn = (known after apply)
          + type             = "forward"
        }
    }

  # aws_lb_listener_rule.forward will be created
  + resource "aws_lb_listener_rule" "forward" {
      + arn          = (known after apply)
      + id           = (known after apply)
      + listener_arn = (known after apply)
      + priority     = 99
      + tags_all     = (known after apply)

      + action {
          + order            = (known after apply)
          + target_group_arn = (known after apply)
          + type             = "forward"
        }

      + condition {

          + path_pattern {
              + values = [
                  + "/*",
                ]
            }
        }
    }

  # aws_lb_target_group.ec2_web will be created
  + resource "aws_lb_target_group" "ec2_web" {
      + arn                                = (known after apply)
      + arn_suffix                         = (known after apply)
      + connection_termination             = false
      + deregistration_delay               = "300"
      + id                                 = (known after apply)
      + lambda_multi_value_headers_enabled = false
      + load_balancing_algorithm_type      = (known after apply)
      + name                               = "terraform-tips-dev-tg-ec2-web"
      + port                               = 80
      + preserve_client_ip                 = (known after apply)
      + protocol                           = "HTTP"
      + protocol_version                   = (known after apply)
      + proxy_protocol_v2                  = false
      + slow_start                         = 0
      + tags                               = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-tg-ec2-web"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + tags_all                           = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-tg-ec2-web"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + target_type                        = "instance"
      + vpc_id                             = (known after apply)

      + health_check {
          + enabled             = true
          + healthy_threshold   = 3
          + interval            = 30
          + matcher             = (known after apply)
          + path                = "/index.html"
          + port                = "traffic-port"
          + protocol            = "HTTP"
          + timeout             = (known after apply)
          + unhealthy_threshold = 3
        }

      + stickiness {
          + cookie_duration = (known after apply)
          + cookie_name     = (known after apply)
          + enabled         = (known after apply)
          + type            = (known after apply)
        }
    }

  # aws_nat_gateway.main_a will be created
  + resource "aws_nat_gateway" "main_a" {
      + allocation_id        = (known after apply)
      + connectivity_type    = "public"
      + id                   = (known after apply)
      + network_interface_id = (known after apply)
      + private_ip           = (known after apply)
      + public_ip            = (known after apply)
      + subnet_id            = (known after apply)
      + tags                 = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-ngw-a"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + tags_all             = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-ngw-a"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
    }

  # aws_nat_gateway.main_c will be created
  + resource "aws_nat_gateway" "main_c" {
      + allocation_id        = (known after apply)
      + connectivity_type    = "public"
      + id                   = (known after apply)
      + network_interface_id = (known after apply)
      + private_ip           = (known after apply)
      + public_ip            = (known after apply)
      + subnet_id            = (known after apply)
      + tags                 = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-ngw-c"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + tags_all             = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-ngw-c"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
    }

  # aws_network_acl.private_a will be created
  + resource "aws_network_acl" "private_a" {
      + arn        = (known after apply)
      + egress     = [
          + {
              + action          = "allow"
              + cidr_block      = "192.0.0.64/27"
              + from_port       = 3306
              + icmp_code       = null
              + icmp_type       = null
              + ipv6_cidr_block = ""
              + protocol        = "tcp"
              + rule_no         = 101
              + to_port         = 3306
            },
        ]
      + id         = (known after apply)
      + ingress    = [
          + {
              + action          = "allow"
              + cidr_block      = "192.0.0.64/27"
              + from_port       = 3306
              + icmp_code       = null
              + icmp_type       = null
              + ipv6_cidr_block = ""
              + protocol        = "tcp"
              + rule_no         = 100
              + to_port         = 3306
            },
        ]
      + owner_id   = (known after apply)
      + subnet_ids = (known after apply)
      + tags       = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-acl-prv-a"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + tags_all   = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-acl-prv-a"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + vpc_id     = (known after apply)
    }

  # aws_network_acl.private_c will be created
  + resource "aws_network_acl" "private_c" {
      + arn        = (known after apply)
      + egress     = [
          + {
              + action          = "allow"
              + cidr_block      = "192.0.0.96/27"
              + from_port       = 3306
              + icmp_code       = null
              + icmp_type       = null
              + ipv6_cidr_block = ""
              + protocol        = "tcp"
              + rule_no         = 101
              + to_port         = 3306
            },
        ]
      + id         = (known after apply)
      + ingress    = [
          + {
              + action          = "allow"
              + cidr_block      = "192.0.0.96/27"
              + from_port       = 3306
              + icmp_code       = null
              + icmp_type       = null
              + ipv6_cidr_block = ""
              + protocol        = "tcp"
              + rule_no         = 100
              + to_port         = 3306
            },
        ]
      + owner_id   = (known after apply)
      + subnet_ids = (known after apply)
      + tags       = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-acl-prv-c"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + tags_all   = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-acl-prv-c"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + vpc_id     = (known after apply)
    }

  # aws_network_acl.protected_a will be created
  + resource "aws_network_acl" "protected_a" {
      + arn        = (known after apply)
      + egress     = [
          + {
              + action          = "allow"
              + cidr_block      = "0.0.0.0/0"
              + from_port       = 0
              + icmp_code       = null
              + icmp_type       = null
              + ipv6_cidr_block = ""
              + protocol        = "-1"
              + rule_no         = 101
              + to_port         = 0
            },
        ]
      + id         = (known after apply)
      + ingress    = [
          + {
              + action          = "allow"
              + cidr_block      = "0.0.0.0/0"
              + from_port       = 0
              + icmp_code       = null
              + icmp_type       = null
              + ipv6_cidr_block = ""
              + protocol        = "-1"
              + rule_no         = 100
              + to_port         = 0
            },
        ]
      + owner_id   = (known after apply)
      + subnet_ids = (known after apply)
      + tags       = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-acl-prt-a"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + tags_all   = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-acl-prt-a"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + vpc_id     = (known after apply)
    }

  # aws_network_acl.protected_c will be created
  + resource "aws_network_acl" "protected_c" {
      + arn        = (known after apply)
      + egress     = [
          + {
              + action          = "allow"
              + cidr_block      = "0.0.0.0/0"
              + from_port       = 0
              + icmp_code       = null
              + icmp_type       = null
              + ipv6_cidr_block = ""
              + protocol        = "-1"
              + rule_no         = 101
              + to_port         = 0
            },
        ]
      + id         = (known after apply)
      + ingress    = [
          + {
              + action          = "allow"
              + cidr_block      = "0.0.0.0/0"
              + from_port       = 0
              + icmp_code       = null
              + icmp_type       = null
              + ipv6_cidr_block = ""
              + protocol        = "-1"
              + rule_no         = 100
              + to_port         = 0
            },
        ]
      + owner_id   = (known after apply)
      + subnet_ids = (known after apply)
      + tags       = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-acl-prt-c"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + tags_all   = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-acl-prt-c"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + vpc_id     = (known after apply)
    }

  # aws_network_acl.public will be created
  + resource "aws_network_acl" "public" {
      + arn        = (known after apply)
      + egress     = [
          + {
              + action          = "allow"
              + cidr_block      = "0.0.0.0/0"
              + from_port       = 0
              + icmp_code       = null
              + icmp_type       = null
              + ipv6_cidr_block = ""
              + protocol        = "-1"
              + rule_no         = 101
              + to_port         = 0
            },
        ]
      + id         = (known after apply)
      + ingress    = [
          + {
              + action          = "allow"
              + cidr_block      = "0.0.0.0/0"
              + from_port       = 0
              + icmp_code       = null
              + icmp_type       = null
              + ipv6_cidr_block = ""
              + protocol        = "-1"
              + rule_no         = 100
              + to_port         = 0
            },
        ]
      + owner_id   = (known after apply)
      + subnet_ids = (known after apply)
      + tags       = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-acl-pub"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + tags_all   = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-acl-pub"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + vpc_id     = (known after apply)
    }

  # aws_rds_cluster.db_cluster will be created
  + resource "aws_rds_cluster" "db_cluster" {
      + apply_immediately               = (known after apply)
      + arn                             = (known after apply)
      + availability_zones              = (known after apply)
      + backup_retention_period         = 7
      + cluster_identifier              = "terraform-tips-dev-rds"
      + cluster_identifier_prefix       = (known after apply)
      + cluster_members                 = (known after apply)
      + cluster_resource_id             = (known after apply)
      + copy_tags_to_snapshot           = true
      + database_name                   = (known after apply)
      + db_cluster_parameter_group_name = "terraform-tips-dev-rds-cpg"
      + db_subnet_group_name            = "terraform-tips-dev-db-subnetg"
      + enable_global_write_forwarding  = false
      + enable_http_endpoint            = false
      + endpoint                        = (known after apply)
      + engine                          = "aurora-mysql"
      + engine_mode                     = "provisioned"
      + engine_version                  = "5.7.mysql_aurora.2.09.2"
      + engine_version_actual           = (known after apply)
      + hosted_zone_id                  = (known after apply)
      + iam_roles                       = (known after apply)
      + id                              = (known after apply)
      + kms_key_id                      = (known after apply)
      + master_password                 = (sensitive value)
      + master_username                 = "TerraformLocal"
      + port                            = 3306
      + preferred_backup_window         = "19:30-20:00"
      + preferred_maintenance_window    = "tue:20:15-tue:20:45"
      + reader_endpoint                 = (known after apply)
      + skip_final_snapshot             = true
      + storage_encrypted               = true
      + tags                            = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-rds-cluster"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + tags_all                        = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-rds-cluster"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + vpc_security_group_ids          = (known after apply)
    }

  # aws_rds_cluster_parameter_group.db_cluster_param will be created
  + resource "aws_rds_cluster_parameter_group" "db_cluster_param" {
      + arn         = (known after apply)
      + description = "Managed by Terraform"
      + family      = "aurora-mysql5.7"
      + id          = (known after apply)
      + name        = "terraform-tips-dev-rds-cpg"
      + name_prefix = (known after apply)
      + tags        = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-rds-clu-pg"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + tags_all    = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-rds-clu-pg"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }

      + parameter {
          + apply_method = "immediate"
          + name         = "character_set_database"
          + value        = "utf8"
        }
      + parameter {
          + apply_method = "immediate"
          + name         = "character_set_server"
          + value        = "utf8"
        }
      + parameter {
          + apply_method = "immediate"
          + name         = "collation_server"
          + value        = "utf8_general_ci"
        }
      + parameter {
          + apply_method = "immediate"
          + name         = "log_bin_trust_function_creators"
          + value        = "1"
        }
      + parameter {
          + apply_method = "immediate"
          + name         = "time_zone"
          + value        = "Asia/Tokyo"
        }
    }

  # aws_route.default_igw will be created
  + resource "aws_route" "default_igw" {
      + destination_cidr_block = "0.0.0.0/0"
      + gateway_id             = (known after apply)
      + id                     = (known after apply)
      + instance_id            = (known after apply)
      + instance_owner_id      = (known after apply)
      + network_interface_id   = (known after apply)
      + origin                 = (known after apply)
      + route_table_id         = (known after apply)
      + state                  = (known after apply)
    }

  # aws_route_table.private will be created
  + resource "aws_route_table" "private" {
      + arn              = (known after apply)
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + route            = (known after apply)
      + tags             = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-rtb-prv"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + tags_all         = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-rtb-prv"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + vpc_id           = (known after apply)
    }

  # aws_route_table.protected_a will be created
  + resource "aws_route_table" "protected_a" {
      + arn              = (known after apply)
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + route            = [
          + {
              + carrier_gateway_id         = ""
              + cidr_block                 = "0.0.0.0/0"
              + destination_prefix_list_id = ""
              + egress_only_gateway_id     = ""
              + gateway_id                 = ""
              + instance_id                = ""
              + ipv6_cidr_block            = ""
              + local_gateway_id           = ""
              + nat_gateway_id             = (known after apply)
              + network_interface_id       = ""
              + transit_gateway_id         = ""
              + vpc_endpoint_id            = ""
              + vpc_peering_connection_id  = ""
            },
        ]
      + tags             = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-rtb-prt-a"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + tags_all         = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-rtb-prt-a"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + vpc_id           = (known after apply)
    }

  # aws_route_table.protected_c will be created
  + resource "aws_route_table" "protected_c" {
      + arn              = (known after apply)
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + route            = [
          + {
              + carrier_gateway_id         = ""
              + cidr_block                 = "0.0.0.0/0"
              + destination_prefix_list_id = ""
              + egress_only_gateway_id     = ""
              + gateway_id                 = ""
              + instance_id                = ""
              + ipv6_cidr_block            = ""
              + local_gateway_id           = ""
              + nat_gateway_id             = (known after apply)
              + network_interface_id       = ""
              + transit_gateway_id         = ""
              + vpc_endpoint_id            = ""
              + vpc_peering_connection_id  = ""
            },
        ]
      + tags             = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-rtb-prt-c"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + tags_all         = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-rtb-prt-c"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + vpc_id           = (known after apply)
    }

  # aws_route_table.public will be created
  + resource "aws_route_table" "public" {
      + arn              = (known after apply)
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + route            = [
          + {
              + carrier_gateway_id         = ""
              + cidr_block                 = "0.0.0.0/0"
              + destination_prefix_list_id = ""
              + egress_only_gateway_id     = ""
              + gateway_id                 = (known after apply)
              + instance_id                = ""
              + ipv6_cidr_block            = ""
              + local_gateway_id           = ""
              + nat_gateway_id             = ""
              + network_interface_id       = ""
              + transit_gateway_id         = ""
              + vpc_endpoint_id            = ""
              + vpc_peering_connection_id  = ""
            },
        ]
      + tags             = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-rtb-pub"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + tags_all         = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-rtb-pub"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + vpc_id           = (known after apply)
    }

  # aws_route_table_association.private_a will be created
  + resource "aws_route_table_association" "private_a" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_route_table_association.private_c will be created
  + resource "aws_route_table_association" "private_c" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_route_table_association.protected_a will be created
  + resource "aws_route_table_association" "protected_a" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_route_table_association.protected_c will be created
  + resource "aws_route_table_association" "protected_c" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_route_table_association.public_a will be created
  + resource "aws_route_table_association" "public_a" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_route_table_association.public_c will be created
  + resource "aws_route_table_association" "public_c" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_security_group.alb_web will be created
  + resource "aws_security_group" "alb_web" {
      + arn                    = (known after apply)
      + description            = "terraform-tips-dev-alb-web-sg"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 80
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 80
            },
        ]
      + name                   = "terraform-tips-dev-alb-web-sg"
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-alb"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + tags_all               = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-alb"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + vpc_id                 = (known after apply)
    }

  # aws_security_group.ec2_web will be created
  + resource "aws_security_group" "ec2_web" {
      + arn                    = (known after apply)
      + description            = "terraform-tips-dev-ec2-web-sg"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "192.0.0.0/27",
                  + "192.0.0.32/27",
                ]
              + description      = ""
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
            },
          + {
              + cidr_blocks      = []
              + description      = ""
              + from_port        = 80
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = (known after apply)
              + self             = false
              + to_port          = 80
            },
        ]
      + name                   = "terraform-tips-dev-ec2-web-sg"
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-ec2-web"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + tags_all               = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-ec2-web"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + vpc_id                 = (known after apply)
    }

  # aws_security_group.rds will be created
  + resource "aws_security_group" "rds" {
      + arn                    = (known after apply)
      + description            = "terraform-tips-dev-rds-sg"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = []
              + description      = ""
              + from_port        = 3306
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = (known after apply)
              + self             = false
              + to_port          = 3306
            },
        ]
      + name                   = "terraform-tips-dev-rds-sg"
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-rds-sg"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + tags_all               = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-rds-sg"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + vpc_id                 = (known after apply)
    }

  # aws_security_group.vpce will be created
  + resource "aws_security_group" "vpce" {
      + arn                    = (known after apply)
      + description            = "terraform-tips-dev-ec2-vpce-sg"
      + egress                 = (known after apply)
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "192.0.0.64/27",
                  + "192.0.0.96/27",
                ]
              + description      = "HTTPS"
              + from_port        = 443
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 443
            },
        ]
      + name                   = "terraform-tips-dev-ec2-vpce-sg"
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-ec2-vpce"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + tags_all               = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-ec2-vpce"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + vpc_id                 = (known after apply)
    }

  # aws_subnet.private_a will be created
  + resource "aws_subnet" "private_a" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "ap-northeast-1a"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "192.0.0.128/27"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-sbn-prv-a"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + tags_all                                       = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-sbn-prv-a"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + vpc_id                                         = (known after apply)
    }

  # aws_subnet.private_c will be created
  + resource "aws_subnet" "private_c" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "ap-northeast-1c"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "192.0.0.160/27"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-sbn-prv-c"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + tags_all                                       = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-sbn-prv-c"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + vpc_id                                         = (known after apply)
    }

  # aws_subnet.protected_a will be created
  + resource "aws_subnet" "protected_a" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "ap-northeast-1a"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "192.0.0.64/27"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-sbn-prt-a"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + tags_all                                       = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-sbn-prt-a"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + vpc_id                                         = (known after apply)
    }

  # aws_subnet.protected_c will be created
  + resource "aws_subnet" "protected_c" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "ap-northeast-1c"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "192.0.0.96/27"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-sbn-prt-c"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + tags_all                                       = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-sbn-prt-c"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + vpc_id                                         = (known after apply)
    }

  # aws_subnet.public_a will be created
  + resource "aws_subnet" "public_a" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "ap-northeast-1a"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "192.0.0.0/27"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = true
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-sbn-pub-a"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + tags_all                                       = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-sbn-pub-a"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + vpc_id                                         = (known after apply)
    }

  # aws_subnet.public_c will be created
  + resource "aws_subnet" "public_c" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "ap-northeast-1c"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "192.0.0.32/27"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = true
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-sbn-pub-c"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + tags_all                                       = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-sbn-pub-c"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + vpc_id                                         = (known after apply)
    }

  # aws_vpc.main will be created
  + resource "aws_vpc" "main" {
      + arn                                  = (known after apply)
      + cidr_block                           = "192.0.0.0/16"
      + default_network_acl_id               = (known after apply)
      + default_route_table_id               = (known after apply)
      + default_security_group_id            = (known after apply)
      + dhcp_options_id                      = (known after apply)
      + enable_classiclink                   = (known after apply)
      + enable_classiclink_dns_support       = (known after apply)
      + enable_dns_hostnames                 = true
      + enable_dns_support                   = true
      + id                                   = (known after apply)
      + instance_tenancy                     = "default"
      + ipv6_association_id                  = (known after apply)
      + ipv6_cidr_block                      = (known after apply)
      + ipv6_cidr_block_network_border_group = (known after apply)
      + main_route_table_id                  = (known after apply)
      + owner_id                             = (known after apply)
      + tags                                 = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-vpc"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + tags_all                             = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-vpc"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
    }

  # aws_vpc_endpoint.ec2messages will be created
  + resource "aws_vpc_endpoint" "ec2messages" {
      + arn                   = (known after apply)
      + cidr_blocks           = (known after apply)
      + dns_entry             = (known after apply)
      + id                    = (known after apply)
      + network_interface_ids = (known after apply)
      + owner_id              = (known after apply)
      + policy                = (known after apply)
      + prefix_list_id        = (known after apply)
      + private_dns_enabled   = true
      + requester_managed     = (known after apply)
      + route_table_ids       = (known after apply)
      + security_group_ids    = (known after apply)
      + service_name          = "com.amazonaws.ap-northeast-1.ec2messages"
      + state                 = (known after apply)
      + subnet_ids            = (known after apply)
      + tags                  = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-vpce-ec2messages"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + tags_all              = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-vpce-ec2messages"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + vpc_endpoint_type     = "Interface"
      + vpc_id                = (known after apply)
    }

  # aws_vpc_endpoint.ssm will be created
  + resource "aws_vpc_endpoint" "ssm" {
      + arn                   = (known after apply)
      + cidr_blocks           = (known after apply)
      + dns_entry             = (known after apply)
      + id                    = (known after apply)
      + network_interface_ids = (known after apply)
      + owner_id              = (known after apply)
      + policy                = (known after apply)
      + prefix_list_id        = (known after apply)
      + private_dns_enabled   = true
      + requester_managed     = (known after apply)
      + route_table_ids       = (known after apply)
      + security_group_ids    = (known after apply)
      + service_name          = "com.amazonaws.ap-northeast-1.ssm"
      + state                 = (known after apply)
      + subnet_ids            = (known after apply)
      + tags                  = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-vpce-ssm"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + tags_all              = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-vpce-ssm"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + vpc_endpoint_type     = "Interface"
      + vpc_id                = (known after apply)
    }

  # aws_vpc_endpoint.ssmmessages will be created
  + resource "aws_vpc_endpoint" "ssmmessages" {
      + arn                   = (known after apply)
      + cidr_blocks           = (known after apply)
      + dns_entry             = (known after apply)
      + id                    = (known after apply)
      + network_interface_ids = (known after apply)
      + owner_id              = (known after apply)
      + policy                = (known after apply)
      + prefix_list_id        = (known after apply)
      + private_dns_enabled   = true
      + requester_managed     = (known after apply)
      + route_table_ids       = (known after apply)
      + security_group_ids    = (known after apply)
      + service_name          = "com.amazonaws.ap-northeast-1.ssmmessages"
      + state                 = (known after apply)
      + subnet_ids            = (known after apply)
      + tags                  = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-vpce-ssmmessages"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + tags_all              = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-vpce-ssmmessages"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + vpc_endpoint_type     = "Interface"
      + vpc_id                = (known after apply)
    }

  # aws_wafv2_web_acl.alb will be created
  + resource "aws_wafv2_web_acl" "alb" {
      + arn         = (known after apply)
      + capacity    = (known after apply)
      + description = "terraform-tips-webacl-dev"
      + id          = (known after apply)
      + lock_token  = (known after apply)
      + name        = "terraform-tips-webacl-dev"
      + scope       = "REGIONAL"
      + tags        = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-webacl"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }
      + tags_all    = {
          + "Env"     = "develop"
          + "Name"    = "terraform-tips-dev-webacl"
          + "Project" = "develop"
          + "Stage"   = "develop"
        }

      + default_action {
          + allow {
            }
        }

      + rule {
          + name     = "AWS-AWSManagedRulesAdminProtectionRuleSet"
          + priority = 3

          + override_action {

              + none {}
            }

          + statement {

              + managed_rule_group_statement {
                  + name        = "AWSManagedRulesAdminProtectionRuleSet"
                  + vendor_name = "AWS"
                }
            }

          + visibility_config {
              + cloudwatch_metrics_enabled = true
              + metric_name                = "AWSManagedRulesAdminProtectionRuleSet"
              + sampled_requests_enabled   = true
            }
        }
      + rule {
          + name     = "AWS-AWSManagedRulesCommonRuleSet"
          + priority = 4

          + override_action {

              + none {}
            }

          + statement {

              + managed_rule_group_statement {
                  + name        = "AWSManagedRulesCommonRuleSet"
                  + vendor_name = "AWS"
                }
            }

          + visibility_config {
              + cloudwatch_metrics_enabled = true
              + metric_name                = "AWSManagedRulesCommonRuleSet"
              + sampled_requests_enabled   = true
            }
        }
      + rule {
          + name     = "AWS-AWSManagedRulesKnownBadInputsRuleSet"
          + priority = 0

          + override_action {

              + none {}
            }

          + statement {

              + managed_rule_group_statement {
                  + name        = "AWSManagedRulesKnownBadInputsRuleSet"
                  + vendor_name = "AWS"
                }
            }

          + visibility_config {
              + cloudwatch_metrics_enabled = true
              + metric_name                = "AWSManagedRulesKnownBadInputsRuleSet"
              + sampled_requests_enabled   = true
            }
        }
      + rule {
          + name     = "AWS-AWSManagedRulesSQLiRuleSet"
          + priority = 2

          + override_action {

              + none {}
            }

          + statement {

              + managed_rule_group_statement {
                  + name        = "AWSManagedRulesSQLiRuleSet"
                  + vendor_name = "AWS"
                }
            }

          + visibility_config {
              + cloudwatch_metrics_enabled = true
              + metric_name                = "AWSManagedRulesSQLiRuleSet"
              + sampled_requests_enabled   = true
            }
        }
      + rule {
          + name     = "AWS-AWSManagedRulesUnixRuleSet"
          + priority = 1

          + override_action {

              + none {}
            }

          + statement {

              + managed_rule_group_statement {
                  + name        = "AWSManagedRulesUnixRuleSet"
                  + vendor_name = "AWS"
                }
            }

          + visibility_config {
              + cloudwatch_metrics_enabled = true
              + metric_name                = "AWSManagedRulesUnixRuleSet"
              + sampled_requests_enabled   = true
            }
        }

      + visibility_config {
          + cloudwatch_metrics_enabled = true
          + metric_name                = "terraform-tips-webacl-dev"
          + sampled_requests_enabled   = true
        }
    }

  # aws_wafv2_web_acl_association.web_alb will be created
  + resource "aws_wafv2_web_acl_association" "web_alb" {
      + id           = (known after apply)
      + resource_arn = (known after apply)
      + web_acl_arn  = (known after apply)
    }

Plan: 55 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + aurora_endpint        = (known after apply)
  + aurora_reader_endpint = (known after apply)
  + web_alb_fqdn          = (known after apply)

------------------------------------------------------------------------

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.
```

# Apply
<img width="822" alt="??????????????????????????? 2022-04-21 13 00 27" src="https://user-images.githubusercontent.com/85344890/164381564-e070bc14-5390-4c9c-8035-53d0a4e455f0.png">

# ALB operation
<img width="843" alt="??????????????????????????? 2022-04-21 13 00 57" src="https://user-images.githubusercontent.com/85344890/164381621-b024640a-b297-405a-b39a-637f96483725.png">
<img width="830" alt="??????????????????????????? 2022-04-21 13 09 36" src="https://user-images.githubusercontent.com/85344890/164381646-c3214dff-5c43-4455-8a69-1e58b1b3bbdb.png">

# ALB logs
<img width="1593" alt="??????????????????????????? 2022-04-21 13 07 43" src="https://user-images.githubusercontent.com/85344890/164381790-5566505a-25f2-4984-8b65-c451fbb7ae34.png">

``` alb.log
http 2022-04-21T04:00:47.677335Z app/terraform-tips-dev-alb-web/450cd8175f4b3aad 106.72.163.65:6703 192.0.0.92:80 0.015 0.001 0.000 200 200 505 323 "GET http://terraform-tips-dev-alb-web-1596949353.ap-northeast-1.elb.amazonaws.com:80/ HTTP/1.1" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36" - - arn:aws:elasticloadbalancing:ap-northeast-1:535401992203:targetgroup/terraform-tips-dev-tg-ec2-web/3862851be6f386d7 "Root=1-6260d6ef-6897c0dd479683955be26ba6" "-" "-" 99 2022-04-21T04:00:47.661000Z "waf,forward" "-" "-" "192.0.0.92:80" "200" "-" "-"
http 2022-04-21T04:00:48.211679Z app/terraform-tips-dev-alb-web/450cd8175f4b3aad 106.72.163.65:6703 192.0.0.108:80 0.003 0.002 0.000 404 404 504 375 "GET http://terraform-tips-dev-alb-web-1596949353.ap-northeast-1.elb.amazonaws.com:80/favicon.ico HTTP/1.1" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36" - - arn:aws:elasticloadbalancing:ap-northeast-1:535401992203:targetgroup/terraform-tips-dev-tg-ec2-web/3862851be6f386d7 "Root=1-6260d6f0-2c0cf32a6daee1e84c6db730" "-" "-" 99 2022-04-21T04:00:48.206000Z "waf,forward" "-" "-" "192.0.0.108:80" "404" "-" "-"
http 2022-04-21T04:00:59.176494Z app/terraform-tips-dev-alb-web/450cd8175f4b3aad 106.72.163.65:6703 192.0.0.92:80 0.001 0.001 0.000 304 304 616 227 "GET http://terraform-tips-dev-alb-web-1596949353.ap-northeast-1.elb.amazonaws.com:80/ HTTP/1.1" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36" - - arn:aws:elasticloadbalancing:ap-northeast-1:535401992203:targetgroup/terraform-tips-dev-tg-ec2-web/3862851be6f386d7 "Root=1-6260d6fb-7ac1c888494366f22943761e" "-" "-" 99 2022-04-21T04:00:59.174000Z "waf,forward" "-" "-" "192.0.0.92:80" "304" "-" "-"
http 2022-04-21T04:01:00.953474Z app/terraform-tips-dev-alb-web/450cd8175f4b3aad 106.72.163.65:6703 192.0.0.108:80 0.003 0.002 0.000 200 200 616 324 "GET http://terraform-tips-dev-alb-web-1596949353.ap-northeast-1.elb.amazonaws.com:80/ HTTP/1.1" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36" - - arn:aws:elasticloadbalancing:ap-northeast-1:535401992203:targetgroup/terraform-tips-dev-tg-ec2-web/3862851be6f386d7 "Root=1-6260d6fc-38e665442804712870f72a08" "-" "-" 99 2022-04-21T04:01:00.948000Z "waf,forward" "-" "-" "192.0.0.108:80" "200" "-" "-"
http 2022-04-21T04:01:32.464671Z app/terraform-tips-dev-alb-web/450cd8175f4b3aad 192.241.217.162:53916 - -1 -1 -1 403 - 110 271 "GET http://52.194.163.12:80/ HTTP/1.1" "Mozilla/5.0 zgrab/0.x" - - arn:aws:elasticloadbalancing:ap-northeast-1:535401992203:targetgroup/terraform-tips-dev-tg-ec2-web/3862851be6f386d7 "Root=1-6260d71c-36b19b356a1d6b907c98253c" "-" "-" -1 2022-04-21T04:01:32.450000Z "waf" "-" "-" "-" "-" "-" "-"
http 2022-04-21T04:03:18.556782Z app/terraform-tips-dev-alb-web/450cd8175f4b3aad 20.124.133.132:56973 192.0.0.92:80 0.012 0.000 0.000 404 404 297 375 "GET http://52.194.163.12:80/.env HTTP/1.1" "Mozilla/5.0 (Linux; U; Android 4.4.2; en-US; HM NOTE 1W Build/KOT49H) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/11.0.5.850 U3/0.8.0 Mobile Safari/534.30" - - arn:aws:elasticloadbalancing:ap-northeast-1:535401992203:targetgroup/terraform-tips-dev-tg-ec2-web/3862851be6f386d7 "Root=1-6260d786-566030c5107753ef55788fe5" "-" "-" 99 2022-04-21T04:03:18.543000Z "waf,forward" "-" "-" "192.0.0.92:80" "404" "-" "-"
http 2022-04-21T04:03:18.880449Z app/terraform-tips-dev-alb-web/450cd8175f4b3aad 20.124.133.132:57412 192.0.0.108:80 0.003 0.002 0.000 200 200 383 324 "POST http://52.194.163.12:80/ HTTP/1.1" "Mozilla/5.0 (Linux; U; Android 4.4.2; en-US; HM NOTE 1W Build/KOT49H) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/11.0.5.850 U3/0.8.0 Mobile Safari/534.30" - - arn:aws:elasticloadbalancing:ap-northeast-1:535401992203:targetgroup/terraform-tips-dev-tg-ec2-web/3862851be6f386d7 "Root=1-6260d786-58c2fb9a174786af31333347" "-" "-" 99 2022-04-21T04:03:18.875000Z "waf,forward" "-" "-" "192.0.0.108:80" "200" "-" "-"
```

# SSM instances
<img width="1591" alt="??????????????????????????? 2022-04-21 13 02 41" src="https://user-images.githubusercontent.com/85344890/164381724-efedb39f-35cd-474e-b985-6bbd43bb6f69.png">
