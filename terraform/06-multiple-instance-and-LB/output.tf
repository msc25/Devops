output "aws_security_group" {
  value = aws_security_group.http_server_sg
}

output "http_server_public_dns" {
  value = [for instance in values(aws_instance.http_servers) : instance.public_dns]
}

output "elb_dns_name" {
  value = aws_elb.elb.dns_name
}