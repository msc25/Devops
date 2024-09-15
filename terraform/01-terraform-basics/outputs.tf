output "my_s3_bucket_complete_details" {
  value = aws_s3_bucket.tf_s3_bucket
}

output "my_iam_user_complete_details"{
  value = aws_iam_user.my_tf_iam_user
}