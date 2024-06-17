# Create an Application Load Balancer for Nginx Server
resource "aws_lb" "nginx-alb" {
  name               = "nginx-server-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.nginx_alb_sg.id]
  subnets            = [aws_subnet.nginx_private_subnet_1.id, aws_subnet.nginx_private_subnet_2.id]

  tags = {
    Name = "nginx-server-alb"
  }
}

# Create a target group for the EC2 instances
resource "aws_lb_target_group" "Nginx_tg" {
  name     = "nginx-server-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.Nginx-vpc.id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200"
  }

  tags = {
    Name = "nginx-server-tg"
  }
}

# Create a listener for the load balancer
resource "aws_lb_listener" "nginx_listener" {
  load_balancer_arn = aws_lb.nginx-alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.Nginx_tg.arn
  }
}

# Attach the EC2 instances to the target group
resource "aws_lb_target_group_attachment" "nginx_tg_attachment" {
  count            = 2
  target_group_arn = aws_lb_target_group.Nginx_tg.arn
  target_id        = aws_instance.nginx-server[count.index].id
  port             = 80
}