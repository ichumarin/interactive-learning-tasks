locals {
  common_tags = {
    Team = "DevOps"
  }
}

resource "aws_iam_user" "bob" {
  name = "bob"
  tags = local.common_tags
}

resource "aws_iam_group" "sysusers" {
  name = "sysusers"
}
resource "aws_iam_user_group_membership" "addtogroup" {
  user = aws_iam_user.bob.name

  groups = [
    aws_iam_group.sysusers.name
  ]
}

output "User_name" {
  value = aws_iam_user.bob.name
}

output "Group_name" {
  value = aws_iam_group.sysusers.name
}