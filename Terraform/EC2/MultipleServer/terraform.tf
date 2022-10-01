terraform {
  backend "s3" {
    bucket         = "documnet"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    #dynamodb_table = "state-locking"
  }
}