resource "tls_private_key" "multiple" {
  algorithm = "RSA"
  rsa_bits  = 4086
}

resource "aws_key_pair" "ssh" {
  key_name   = "sshkey"
  public_key = tls_private_key.multiple.public_key_openssh
}

resource "local_file" "serverssh" {
  content  = tls_private_key.multiple.private_key_pem
  filename = "serverssh.pem"
}

resource "aws_instance" "Webserver" {
  count                  = var.instance_count
  ami                    = lookup(var.amiserver, var.aws_region)
  instance_type          = var.instance_type
  key_name               = aws_key_pair.ssh.id
  vpc_security_group_ids = [aws_security_group.fw-access.id]
  tags = {
    Name  = element(var.instance_tags, count.index)
    Batch = "5AM"
  }
}
resource "aws_security_group" "fw-access" {
  name        = "ssh-access"
  description = "Access from internet via SSH and Web"
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
  value = aws_instance.Webserver.*.public_ip
  #value = aws_instance.WebServer.*.instance_tags
}