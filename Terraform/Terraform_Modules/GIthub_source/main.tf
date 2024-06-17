module "ec2_cluster" {
    source = "github.com/terraform-aws-modules/terraform-aws-ec2-instance.git"

    name    = "my-cluster"
    ami     = "ami-0f40c8f97004632f9"
    instance_type          = "t2.micro"
    subnet_id   = "subnet-0b118e9d5dfedafdb"

    tags = {
    Terraform   = "true"
    Environment = "dev"
    }
}