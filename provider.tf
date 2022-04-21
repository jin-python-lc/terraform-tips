provider "aws" {
  region  = var.region.name
  profile = "terraform@local2"
}

/* provider "aws" {
  region = var.region.name
  # codebuildにアタッチされているRoleをAdmin相当Roleの信頼関係に追加する
  assume_role {
    role_arn     = "arn:aws:iam::${var.aws.account_id}:role/AdminForTerraform"
    session_name = "aws"
  }
} */