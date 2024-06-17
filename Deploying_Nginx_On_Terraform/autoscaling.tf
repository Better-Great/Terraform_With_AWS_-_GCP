# Create Autoscaling groups
resource "aws_autoscaling_group" "nginx-asg" {
  desired_capacity     = 2
  max_size             = 4
  min_size             = 2
  vpc_zone_identifier  = [aws_subnet.nginx_private_subnet_1.id, aws_subnet.nginx_private_subnet_2.id]
  launch_configuration = aws_launch_configuration.lc.id

  target_group_arns = [aws_lb_target_group.Nginx_tg.arn]

  tag {
    key                 = "nginx_keypair.pub"
    value               = "nginx-server"
    propagate_at_launch = true
  }
}

resource "aws_launch_configuration" "lc" {
  name          = "nginx-server-lc"
  image_id      = "ami-05692172625678b4e" 
  instance_type = "t2.micro"
  security_groups = [aws_security_group.nginx-instance-sg.id]
  key_name       = "nginx_keypair" 

  user_data = <<-EOF
              #!/bin/bash
              apt-get update
              apt-get install -y nginx
              echo "Hello from $(hostname -f)" > /var/www/html/index.html
              EOF
}