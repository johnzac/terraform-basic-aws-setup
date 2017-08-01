resource "aws_iam_instance_profile" "s3_access_profile" 
{
  name  = "s3accessprofile"
  role = "${aws_iam_role.role-s3-access.name}"
}
