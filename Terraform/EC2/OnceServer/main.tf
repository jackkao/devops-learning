resource "aws_instance" "webserver" {
  ami           = "ami-017fecd1353bcc96e"
  instance_type = "t2.micro"
  tags = {
    Name        = "WebServer"
    Description = "Web Nginx"
  }
  user_data              = <<-EOF
        #!/bin/bash
        sudo apt update
        sudo apt install nginx -y
        systemctl enable nginx
        systemctl start nginx
        EOF
  key_name               = aws_key_pair.web.id
  vpc_security_group_ids = [aws_security_group.ssh-access.id]
}

resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4084
}

resource "aws_key_pair" "web" {
  key_name   = "webserver"
  public_key = tls_private_key.pk.public_key_openssh

  # provisioner "local-exec" {
  #   command = "echo '${tls_private_key.pk.private_key_pem}' > webssh.pem"
  # }
}

resource "local_file" "webssh" {
  content  = tls_private_key.pk.private_key_pem
  filename = "webssh.pem"
}
resource "aws_security_group" "ssh-access" {
  name        = "ssh-access"
  description = "Access from internet via SSH "
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "publicip" {
  value = aws_instance.webserver.public_ip
}