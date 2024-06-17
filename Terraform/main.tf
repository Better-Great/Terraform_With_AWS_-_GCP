
# Configure the AWS Provider
resource "aws_instance" "beginngerseries" {
    instance_type = "t2.micro"
    ami = "ami-0f2a1bb3c242fe285"
}