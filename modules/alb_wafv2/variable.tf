variable "system_prefix" { type = string }
variable "project" { type = map }
variable "tags" { type = map }
variable "stage" { type = map(any) }
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