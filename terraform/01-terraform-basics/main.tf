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

resource "aws_s3_bucket" "tf_s3_bucket" {
  bucket = "msc-tf-test-bucket"
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.tf_s3_bucket.id #use the tf file local name for the s3 bucket
    versioning_configuration {
      status = "Enabled"
    }
}

resource "aws_iam_user" "my_tf_iam_user" {
  name = "meghraj_iam_user"
}