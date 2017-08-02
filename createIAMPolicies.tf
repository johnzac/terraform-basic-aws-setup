resource "aws_iam_policy" "demoappbucketpolicy" 
{
  name        = "bucket_policy"
  path        = "/"
  description = "Policy to allow complete access to s3 resources"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_policy" "cloudfrontInvalidationPolicy"
{
  name        = "cloudfrontinvalidationpolicy"
  path        = "/"
  description = "Policy to allow cloudfront invalidations"

  policy = <<EOF
{
   "Version": "2012-10-17",
   "Statement":[
      {
         "Effect":"Allow",
         "Action":[
            "cloudfront:GetDistribution",
            "cloudfront:CreateInvalidation",
            "cloudfront:GetInvalidation",
            "cloudfront:ListInvalidations"
         ],
         "Resource":"*"
      }
   ]
}
EOF
}

