resource "aws_cloudwatch_metric_alarm" "cpu-utililization-high-demo-app"
{
alarm_name = "cpu-utililization-high-demo-app"
comparison_operator = "GreaterThanOrEqualToThreshold"
evaluation_periods = "2"
metric_name = "CPUUtilization"
period = "120"
statistic = "Average"
threshold = "20"
alarm_description = "Triggered on high cpu utilization"
alarm_actions = ["${aws_autoscaling_policy.demoAsg-scale-up.arn}"]
namespace = "AWS/EC2"
dimensions
{
AutoScalingGroupName = "${aws_autoscaling_group.demoAsg.name}"
}
}

resource "aws_cloudwatch_metric_alarm" "cpu-utililization-low-demo-app"
{
alarm_name = "cpu-utililization-low-demo-app"
comparison_operator = "LessThanOrEqualToThreshold"
evaluation_periods = "2"
metric_name = "CPUUtilization"
period = "120"
statistic = "Average"
threshold = "15"
namespace = "AWS/EC2"
alarm_description = "Triggered on low cpu utilization"
alarm_actions = ["${aws_autoscaling_policy.demoAsg-scale-down.arn}"]
dimensions
{
AutoScalingGroupName = "${aws_autoscaling_group.demoAsg.name}"
}
}

