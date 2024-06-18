variable "region" {
  default = "us-east-2"
}

variable "public_key_path" {
  description = "The path to the public key file"
  type        = string
  default     = "./levelup_key.pub"
}


variable "instance_ami" {
  description = "AMI for aws EC2 instance"
  default = "ami-09040d770ffe2224f"
}

variable "instance_type" {
  description = "type for aws EC2 instance"
  default = "t2.micro"
}

variable "environment_tag" {
  description = "Environment tag"
  default = "Production"
}
