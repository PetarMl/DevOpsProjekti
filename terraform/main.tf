provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "webserver" {
  ami           = var.ami
  instance_type = "t2.micro"
  key_name      = "kp-projekat"
  security_groups = [aws_security_group.allow_http.name]
tags = {
  Name = "Apache-Terrafrom-Projekat"
}
 
}

resource "aws_security_group" "allow_http" {
  name        = "allow_http"
  description = "Otvaranje port-a 80 za HTTP"
 
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.all_traffic]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = [var.all_traffic]
  }
   ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.all_traffic]
  }
   egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.all_traffic]
  }
}

