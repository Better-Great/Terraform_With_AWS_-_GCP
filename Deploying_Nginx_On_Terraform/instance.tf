# Create an EC2 instance
resource "aws_instance" "nginx-server" {
  count         = 2
  ami           = "ami-05692172625678b4e" 
  instance_type = "t2.micro"
  subnet_id     = element([aws_subnet.nginx_private_subnet_1.id, aws_subnet.nginx_private_subnet_2.id], count.index)
  security_groups = [aws_security_group.nginx-instance-sg.id]
  associate_public_ip_address = false
  key_name = "nginx_keypair" 

  user_data = <<-EOF
              #!/bin/bash
              apt-get update
              apt-get install -y nginx
              echo "Hello from $(hostname -f)" > /var/www/html/index.html
              EOF

  tags = {
    Name = "nginx-server-${count.index}"
  }
}