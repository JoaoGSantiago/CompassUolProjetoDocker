resource "aws_lb" "wordpress_lb" {
  name               = "wordpress-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = [aws_subnet.publica-elb-A.id, aws_subnet.publica-elb-B.id]

  tags = {
    Name = "wordpress-lb"
  }
}

resource "aws_lb_listener" "wordpress_listener" {
  load_balancer_arn = aws_lb.wordpress_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.wordpress_target_group.arn
  }
}

resource "aws_lb_target_group" "wordpress_target_group" {
  name     = "wordpress-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.compass_vpc.id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
    matcher             = "200"
  }

  tags = {
    Name = "wordpress-tg"
  }
}
