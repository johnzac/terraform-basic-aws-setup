resource "aws_iam_group_membership" "s3users" {
  name = "s3-full-access-group"

  users = [
    "${aws_iam_user.s3User.name}"
  ]

  group = "${aws_iam_group.s3FullAccess.name}"
}

