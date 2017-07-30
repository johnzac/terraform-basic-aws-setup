resource "aws_elb" "demoAppElb"
{
name = "demoAppElb"
subnets = ["${aws_subnet.public_subnet-us-west-2b.id}","${aws_subnet.public_subnet-us-west-2a.id}"]
listener
{
instance_port = 80
instance_protocol = "http"
lb_port = 80
lb_protocol = "http"
}

health_check
{
healthy_threshold = 4
unhealthy_threshold = 2
timeout = 5
target = "HTTP:80/ping.html"
interval = 20
}
cross_zone_load_balancing = true
connection_draining_timeout = 400
security_groups = ["${aws_security_group.public-lb.id}"]
tags
{
name = "demoApp ELB"
}
}
