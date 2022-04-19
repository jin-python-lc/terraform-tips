provider "aws" {
  region  = var.region.name
  profile = "terraform@local2"
}

/* provider "aws" {
  region = var.region.name
  assume_role {
    role_arn     = "arn:aws:iam::${var.aws.account_id}:role/AdminForTerraform"
    session_name = "aws"
  }
}

provider "aws" {
  alias  = "us"
  region = "us-east-1"
  assume_role {
    role_arn     = "arn:aws:iam::${var.aws.account_id}:role/AdminForTerraform"
    session_name = "aws_us"
  }
} */