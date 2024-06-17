# Create a security group for the load balancer
resource "aws_security_group" "nginx_alb_sg" {
  name        = "ALBSecurityGroup"
  description = "Security group for the Nginx Application Load Balancer"
  vpc_id      = aws_vpc.Nginx-vpc.id

 ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

   tags = {
    Name = "nginx-alb-sg"
  }
}

# Create a security group for the EC2 instances
resource "aws_security_group" "nginx-instance-sg" {
  name        = "EC2SecurityGroup"
  description = "Security group for the EC2 instances"
  vpc_id      = aws_vpc.Nginx-vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [aws_security_group.nginx_alb_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "nginx-instance-sg"
  }
}
