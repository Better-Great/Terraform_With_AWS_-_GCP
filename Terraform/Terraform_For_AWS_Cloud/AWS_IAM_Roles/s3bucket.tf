#Create AWS S3 Bucket

resource "aws_s3_bucket" "levelup-s3bucket" {
  bucket = "levelup-bucket-45678"

  tags = {
    Name = "levelup-bucket-45678"
  }
}

