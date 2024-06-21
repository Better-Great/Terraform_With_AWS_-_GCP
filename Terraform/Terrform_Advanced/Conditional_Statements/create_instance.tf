provider "aws" {
  region     = var.AWS_REGION
}


module "ec2_cluster" {
    source = "github.com/terraform-aws-modules/terraform-aws-ec2-instance.git"

    name            = "my-cluster"
    ami             = "ami-09040d770ffe2224f"
    instance_type   = "t2.micro"
    subnet_id       = "subnet-0eef6ece96f05d9e2"

    tags = {
    Terraform       = "true"
    Environment     = var.environment
    }
}
