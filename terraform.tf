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
