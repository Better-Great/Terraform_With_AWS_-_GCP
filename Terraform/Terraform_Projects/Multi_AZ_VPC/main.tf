# Creating a VPC for Lazio Stores using terraform modules
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = ">= 3.72.0"

  name = var.lazio_stores_vpc
  cidr = var.vpc_cidr

  azs             = data.aws_availability_zones.available.names
  public_subnets  = var.lazio_stores_public_subnet
  private_subnets = var.lazio_stores_private_subnet

  enable_nat_gateway = true
  single_nat_gateway = true

  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = var.lazio_stores_vpc
  }
}

# The Public Security Group for Lazio Stores
resource "aws_security_group" "public_sg" {
  name        = "${var.lazio_stores_vpc}-public-sg"
  description = "Allow inbound traffic to lazio stores public instances"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
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
    Name = "${var.lazio_stores_vpc}-public-sg"
  }
}

# The Private Security Group for Lazio Stores
resource "aws_security_group" "private_sg" {
  name        = "${var.lazio_stores_vpc}-private-sg"
  description = "Allow internal traffic in private subnets"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.vpc_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.lazio_stores_vpc}-private-sg"
  }
}
