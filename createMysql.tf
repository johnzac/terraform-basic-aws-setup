resource "aws_db_instance" "demoAppMysql" {
  allocated_storage    = 5
  storage_type         = "standard"
  engine               = "mysql"
  engine_version       = "5.6.27"
  instance_class       = "db.t1.micro"
  name                 = "demoappdb"
  username             = "test"
  password             = "testpassword"
  db_subnet_group_name = "${aws_db_subnet_group.mysql_subnet.name}"
  parameter_group_name = "default.mysql5.6"
  vpc_security_group_ids = ["${aws_security_group.mysql.id}"]
  skip_final_snapshot = true
}
