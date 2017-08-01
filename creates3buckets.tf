resource "aws_s3_bucket" "demoApp_bucket" 
{
    bucket = "demoapp-bucket"
    acl = "public-read"

    cors_rule {
        allowed_headers = ["*"]
        allowed_methods = ["GET","POST"]
        allowed_origins = ["*"]
        max_age_seconds = 3000
    }

    policy = <<EOF
{
    "Version": "2008-10-17",
    "Statement": [
        {
            "Sid": "PublicReadForDemoAppBucket",
            "Effect": "Allow",
            "Principal": {
                "AWS": "*"
            },
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::demoapp-bucket/*"
        },
        {
            "Sid": "FullAccessForS3User",
            "Effect": "Allow",
            "Principal": {
                "AWS": "${aws_iam_user.s3User.arn}"
            },
            "Action": "s3:*",
            "Resource": [
                "arn:aws:s3:::demoapp-bucket"
            ]
        }
    ]
}
EOF
}

