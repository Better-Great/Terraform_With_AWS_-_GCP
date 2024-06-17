
resource "aws_instance" "MyFirstInstnace" {
  count         = 3
  ami           = "ami-05692172625678b4e"
  instance_type = "t2.micro"

  tags = {
    Name = "demoinstnce-${count.index}"
  }
}