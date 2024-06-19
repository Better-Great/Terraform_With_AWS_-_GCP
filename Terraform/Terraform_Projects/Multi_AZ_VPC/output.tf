output "vpc_id" {
  description = "The ID of the Lazio Stores VPC"
  value       = module.vpc.vpc_id
}

output "public_subnets" {
  description = "The Public Subets ID of Lazio Stores"
  value       = module.vpc.public_subnets
}

output "private_subnets" {
  description = "The Private Subets ID of Lazio Stores"
  value       = module.vpc.private_subnets
}

output "public_security_group_id" {
  description = "The ID of Lazio Stores public security group"
  value       = aws_security_group.public_sg.id
}

output "private_security_group_id" {
  description = "The ID of Lazio Stores private security group"
  value       = aws_security_group.private_sg.id
}