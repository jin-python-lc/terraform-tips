resource "aws_lb" "web" {
  name                             = "${local.system_prefix}-alb-web"
  internal                         = false
  load_balancer_type               = "application"
  subnets                          = [aws_subnet.public_a.id, aws_subnet.public_c.id]
  security_groups                  = [aws_security_group.alb_web.id]
  enable_deletion_protection       = false
  #enable_cross_zone_load_balancing = true
  /* access_logs {
    bucket  = local.bucket
    prefix  = "AlbLogs"
    enabled = true
  } */

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
      path_pattern{
        values = ["/*"]
      }
  }
}

resource "aws_lb_target_group" "ec2_web" {
  name                 = "${local.system_prefix}-tg-ec2-web"
  port                 = 80
  protocol             = "HTTP"
  target_type          = "instance"
  vpc_id               = aws_vpc.main.id
  tags                 = merge(local.tags, map("Name", "${local.system_prefix}-tg-ec2-web"))
  health_check {
    protocol            = "HTTP"
    path                = var.health_check_path
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