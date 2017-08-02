resource "aws_iam_policy_attachment" "s3policyattach" 
{
  name       = "s3-attachment"
  groups     = ["${aws_iam_group.s3FullAccess.name}"]
  roles       = ["${aws_iam_role.role-s3-access.name}"]
  policy_arn = "${aws_iam_policy.demoappbucketpolicy.arn}"
}

resource "aws_iam_policy_attachment" "cloudFrontInvalidationPolicyAttach"
{
  name       = "cloudfront-policy-attachment"
  groups     = ["${aws_iam_group.s3FullAccess.name}"]
  roles       = ["${aws_iam_role.role-s3-access.name}"]
  policy_arn = "${aws_iam_policy.cloudfrontInvalidationPolicy.arn}"
}

