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

variable "iam_user_name_prefix" {
  default = "meghraj_iam_user"
}

resource "aws_iam_user" "my_iam_users" {
  count = 3
  name = "${var.iam_user_name_prefix}_${count.index}"
}