# Create an output 
output "alb_dns_name" {
  value = aws_lb.nginx-alb.dns_name
}