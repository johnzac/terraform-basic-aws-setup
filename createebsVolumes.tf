resource "aws_ebs_volume" "buildMasterSecondary" {
  availability_zone = "${aws_instance.buildMaster.availability_zone}"
  size              = 30
}
