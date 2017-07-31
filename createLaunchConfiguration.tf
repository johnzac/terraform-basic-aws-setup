resource "aws_launch_configuration" "demoAppConfig"
{
name = "demoAppConfig"
image_id = "ami-efd0428f"
instance_type = "t2.micro"
security_groups = ["${aws_security_group.private-sg.id}"]
key_name = "mysql-key"
user_data = "${file("userDataInstance")}"
 lifecycle {
    create_before_destroy = true
  }
}
