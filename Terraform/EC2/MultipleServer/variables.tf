variable "amiserver" {
  type = map(any)
  default = {
    "us-west-2" = "ami-017fecd1353bcc96e"
    "us-west-1" = "ami-08e2d37b6a0129927"
  }
}

variable "instance_count" {
  default = "2"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "instance_tags" {
  type    = list(any)
  default = ["WebServer-01", "WebServer-02"]
}

variable "aws_region" {
  default = "us-west-2"
}