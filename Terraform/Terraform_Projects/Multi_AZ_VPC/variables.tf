# The VPC region for Lazio_Stores
variable "aws_region" {
  description = "AWS region to deploy Lazio_Stores resources"
  type        = string
  default     = "eu-west-1"
}
# The name of the vpc being created for Lazio_Stores
variable "lazio_stores_vpc" {
  description = "Lazio_Stores VPC"
  type        = string
  default     = "my-secure-vpc"
}
# The CIDR lock for Lazio_Stores
variable "vpc_cidr" {
  description = "The CIDR block for Lazio_Stores VPC"
  type        = string
  default     = "10.0.0.0/16"
}

data "aws_availability_zones" "available" {
  state = "available"
}



# The various public subnets for Lazio_Stores
variable "lazio_stores_public_subnet" {
  description = "Public subnets for Lazio Stores"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}
# The various private subnets for Lazio_Stores
variable "lazio_stores_private_subnet" {
  description = "Private subnets for Lazio Stores"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

