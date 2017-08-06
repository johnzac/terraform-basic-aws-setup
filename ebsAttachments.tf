resource "aws_volume_attachment" "ebs_attachment_buildmaster" {
  device_name = "/dev/sdh"
  volume_id   = "${aws_ebs_volume.buildMasterSecondary.id}"
  instance_id = "${aws_instance.buildMaster.id}"
}
