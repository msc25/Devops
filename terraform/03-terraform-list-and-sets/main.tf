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

variable "names" {
  default = ["meghraj", "msc"]
}

resource "aws_iam_user" "my_iam_users" {
  #count = length(var.names)
  #name = var.names[count.index]
  for_each = toset(var.names)
  name = each.value
}