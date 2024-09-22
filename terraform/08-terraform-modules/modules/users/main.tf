variable "environment" {
  default="default"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.67"
    }
  }
}

provider "aws"{
    region = "us-east-1"
}

resource "aws_iam_user" "my_tf_iam_user" {
  name = "${local.iam_user_extension}_${var.environment}"
}

locals {
  iam_user_extension="meghraj_iam_user"
}