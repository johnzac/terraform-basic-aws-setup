resource "aws_iam_group" "s3FullAccess" 
{
  name = "s3fullaccess"
  path = "/"
}
