resource "aws_autoscaling_group" "demoAsg"
{
vpc_zone_identifier = ["${aws_subnet.private_subnet-us-west-2b.id}","${aws_subnet.private_subnet-us-west-2a.id}"]
name = "demoApp ASG"
max_size = 5
min_size = 1
health_check_grace_period = 300
health_check_type = "ELB"
desired_capacity = 1
launch_configuration = "${aws_launch_configuration.demoAppConfig.name}"
load_balancers = ["${aws_elb.demoAppElb.name}"]
 depends_on = ["aws_instance.buildMaster"]
}


resource "aws_autoscaling_policy" "demoAsg-scale-up"
{
name = "demoAsg-scale-up"
scaling_adjustment = 1
adjustment_type = "ChangeInCapacity"
cooldown = 300
autoscaling_group_name = "${aws_autoscaling_group.demoAsg.name}"
}

resource "aws_autoscaling_policy" "demoAsg-scale-down"
{
name = "demoAsg-scale-down"
scaling_adjustment = -1
adjustment_type = "ChangeInCapacity"
cooldown = 300
autoscaling_group_name = "${aws_autoscaling_group.demoAsg.name}"
}






