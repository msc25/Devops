output "aws_security_group" {
  value = aws_security_group.http_server_sg
}

output "http_server_public_dns" {
  value = aws_instance.http_server.public_dns
}