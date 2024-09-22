variable "application_name" {
  default = "07-Backend-state"
}

variable "project_name" {
  default = "users"
}

variable "environment" {
  default = "dev"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.67"
    }
  }
}

terraform {
  backend "s3" {
    bucket = "dev-applications-backend-state-msc-abc"
    key    = "07-Backend-state-dev-users"
    #key = "${var.application_name}-${var.environment}-${var.project_name}"  //app-env-project
    region         = "us-east-1"
    dynamodb_table = "dev_application_locks"
    encrypt        = true
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "my_tf_iam_user" {
  name = "${terraform.workspace}_meghraj_iam_user"
}