resource "aws_iam_policy_attachment" "s3policyattach" 
{
  name       = "s3-attachment"
  groups     = ["${aws_iam_group.s3FullAccess.name}"]
  policy_arn = "${aws_iam_policy.demoappbucketpolicy.arn}"
}
