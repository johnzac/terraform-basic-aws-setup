resource "aws_security_group" "public-sg"
{
name="public-security-group"
description="Security group for publicly accessible instances"
vpc_id="${aws_vpc.demoAppVpc.id}"

}

resource "aws_security_group" "public-lb"
{
name="lb-security-group"
description="Security group for Load Balancer"
ingress{
from_port = 80
to_port = 80
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}

ingress{
from_port = 443
to_port = 443
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}
egress{
from_port = 0
to_port = 0
protocol = "-1"
cidr_blocks = ["0.0.0.0/0"]
}
vpc_id="${aws_vpc.demoAppVpc.id}"

}



resource "aws_security_group" "private-sg"
{
name="private-security-group"
description="Security group for instances in private subnet"
ingress{
from_port = 22
to_port = 22
protocol = "tcp"
security_groups = ["${aws_security_group.public-sg.id}"]
}
ingress{
from_port = 80
to_port = 80
protocol = "tcp"
security_groups = ["${aws_security_group.public-lb.id}"]
}

ingress{
from_port = 443
to_port = 443
protocol = "tcp"
security_groups = ["${aws_security_group.public-lb.id}"]
}

egress{
from_port = 0
to_port = 0
protocol = "-1"
cidr_blocks = ["0.0.0.0/0"]
}

vpc_id="${aws_vpc.demoAppVpc.id}"

}

resource "aws_security_group_rule" "allow-access-proxy" 
{
  type            = "ingress"
  from_port       = 8888
  to_port         = 8888
  protocol        = "tcp"
  source_security_group_id = "${aws_security_group.private-sg.id}"

  security_group_id = "${aws_security_group.public-sg.id}"
}
resource "aws_security_group_rule" "allow-access-ssh"
{
  type            = "ingress"
  from_port       = 22
  to_port         = 22
  protocol        = "tcp"
  cidr_blocks     = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.public-sg.id}"
}
resource "aws_security_group_rule" "allow-all-outbound"
{
  type            = "egress"
  from_port       = 0
  to_port         = 0
  protocol        = "-1"
  cidr_blocks     = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.public-sg.id}"
}



