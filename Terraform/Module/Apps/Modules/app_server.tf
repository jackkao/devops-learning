resource "aws_instance" "app_servers" {
  ami = var.ami
  instance_type = "t2.micro"
  tags = {
    "Name" = "${var.app_region}-app-server"
  }
  depends_on = [
      aws_s3_bucket.payroll_data,
      aws_dynamodb_table.payroll_db
  ]
}