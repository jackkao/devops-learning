resource "aws_iam_user" "admin-user" {
    name = "ccbao"
    tags = {
        Description = "Project Team Leader"
    }
}

resource "aws_iam_policy" "adminUser" {
    name = "AdminUser"
    policy = file("admin-policy.json")
}

resource "aws_iam_user_policy_attachment" "ccbao-admin-access" {
    user = aws_iam_user.admin-user.name
    policy_arn = aws_iam_policy.adminUser.arn
}