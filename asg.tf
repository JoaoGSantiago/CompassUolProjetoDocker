resource "aws_autoscaling_group" "wordpress_asg" {
  name                = "wordpress-asg"
  vpc_zone_identifier = [aws_subnet.privada-app-A.id, aws_subnet.privada-app-B.id]
  desired_capacity    = 2
  min_size            = 2
  max_size            = 4
  health_check_type   = "ELB"
  target_group_arns   = [aws_lb_target_group.wordpress_target_group.arn]

  launch_template {
    id = aws_launch_template.wordpress_template.id
  }
}

resource "aws_autoscaling_policy" "wp_asg_policy" {
  name                   = "wp-asg-target-tracking"
  autoscaling_group_name = aws_autoscaling_group.wordpress_asg.name
  policy_type            = "TargetTrackingScaling"

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 75
  }
}