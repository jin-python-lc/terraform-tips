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