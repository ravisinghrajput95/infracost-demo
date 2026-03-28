resource "aws_lb" "demo_alb" {
  name               = "demo-alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = [aws_subnet.demo_subnet.id]
  security_groups    = [aws_security_group.demo_sg.id]

  tags = {
    Environment = var.environment
    Project     = "finops-demo"
  }
}

resource "aws_lb_target_group" "demo_tg" {
  name     = "demo-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.demo_vpc.id
}

resource "aws_lb_listener" "demo_listener" {
  load_balancer_arn = aws_lb.demo_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.demo_tg.arn
  }
}

resource "aws_lb_target_group_attachment" "demo_attach" {
  target_group_arn = aws_lb_target_group.demo_tg.arn
  target_id        = aws_instance.demo_instance.id
  port             = 80
}
