aws = {
  account_id     = 535401992203 #449764311553
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