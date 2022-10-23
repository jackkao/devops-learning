resource "aws_s3_bucket" "document" {
  bucket = "documnet"
  tags = {
    description = "My document S3 test"
  }
}

resource "aws_s3_bucket_object" "document260922" {
  content = "Customer_bill.pdf"
  key = "Customer_bill.pdf"
  bucket = aws_s3_bucket.document.id
}


#data "aws_iam_group" "document-data" {
#  group_name = "deverlopers"
#}

resource "aws_s3_bucket_policy" "document-policy" {
  bucket = aws_s3_bucket.document.id
  policy = <<EOF
  {
  "Id": "Policy1664128577755",
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Stmt1664128572243",
      "Action": "s3:*",
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::${aws_s3_bucket.document.id}/*",
      "Principal": "*"
      
    }
  ]
}

  EOF
}
