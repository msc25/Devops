terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.67"
    }
  }
}

variable "aws_key_pair" {
  default = "~/aws/aws_keys/meghraj.pem"
}

provider "aws" {
  region = "us-east-1"
}

# //HTTP Server --> 80 TCP
# //SSH --> 22 TCP
#CIDR Block (Allow Access from anywhere) ["0.0.0.0/0"]

resource "aws_security_group" "http_server_sg" {
  name   = "http_server_sg"
  vpc_id = "vpc-04e702118f28b9826"

  tags = {
    name = "http_server_sg"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "http_server" {
  ami                    = "ami-0ebfd941bbafe70c6"
  key_name               = "meghraj"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.http_server_sg.id]
  subnet_id              = "subnet-002cd76e71f667bbe" //get from VPC Dashboard on AWS site

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = file(var.aws_key_pair)
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'Starting provisioning...' > /tmp/provisioning.log",
      "set -x >> /tmp/provisioning.log",
      "sudo yum install httpd -y >> /tmp/provisioning.log",
      "sudo service httpd start >> /tmp/provisioning.log",
      "echo \"Hello to Meghraj Virtual Server at ${self.public_dns}\" | sudo tee /var/www/html/index.html >> /tmp/provisioning.log",
      "echo 'Provisioning completed.' >> /tmp/provisioning.log"
    ]
  }

}

