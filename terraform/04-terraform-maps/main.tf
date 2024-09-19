terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.67"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

variable "users" {
  default = {
    meghraj : { country : "India", department : "ABC" },
    msc : { country : "Canada", department : "DEF" },
    megh : { country : "USA", department : "GHI" }
  }
}

resource "aws_iam_user" "my_iam_users" {
  for_each = var.users
  name     = each.key
  tags = {
    #country: each.value
    country : each.value.country
    department : each.value.department
  }
}