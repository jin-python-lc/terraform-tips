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

  tags = merge(var.tags, map("Name", "${var.project.name}-webacl-${var.stage.short_name}"))

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "${var.project.name}-webacl-${var.stage.short_name}"
    sampled_requests_enabled   = true
  }
}

/* resource "aws_wafv2_web_acl_association" "web_alb" {
  resource_arn = aws_lb.web.arn
  web_acl_arn  = aws_wafv2_web_acl.alb.arn
} */