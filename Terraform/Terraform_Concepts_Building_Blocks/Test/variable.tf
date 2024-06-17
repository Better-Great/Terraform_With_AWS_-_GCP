variable "region" {
  default = "us-west-2"
}

variable "ami" {
  default = "ami-033fabdd332044f06" // Example AMI ID
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  description = "The name of the SSH key pair"
  default = "my-key"
}

variable "subnet_id" {
  description = "The ID of the subnet"
  default = "subnet-064bdd88394a26291" // Example subnet ID
}

variable "security_group" {
  description = "The ID of the security group"
  default = "sg-0c3f439824f9648cd" // Example security group ID
}
