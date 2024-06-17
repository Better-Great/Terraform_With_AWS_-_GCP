resource "aws_instance" "MyFirstInstance" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = var.subnet_id
  security_groups = [var.security_group]

  provisioner "file" {
    source      = "installNginx.sh"
    destination = "/tmp/installNginx.sh"

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("~/.ssh/my-key.pem")
      host        = self.public_ip
      timeout     = "10m"
    }
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/installNginx.sh",
      "/tmp/installNginx.sh"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("~/.ssh/my-key.pem")
      host        = self.public_ip
      timeout     = "5m"
    }
  }

  tags = {
    Name = "MyFirstInstance"
  }
}
