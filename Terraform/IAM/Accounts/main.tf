provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAY5IA3CAQK2RVCWBV"
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
