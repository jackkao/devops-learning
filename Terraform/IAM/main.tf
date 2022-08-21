provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAY5IA3CAQF6PM2ZEI"
  secret_key = "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"
}

resource "aws_iam_group" "group" {
  name = "deverlopers"
}

resource "aws_iam_user" "users" {
  for_each      = toset(var.project_terraform)
  name          = each.value  
}

resource "aws_iam_group_membership" "addtogroup" {
  name = "testing-group-membership"
  for_each = toset(var.project_terraform)
  users = [
      aws_iam_user.users[each.key].name
      ]
  group = aws_iam_group.group.name
  
}
