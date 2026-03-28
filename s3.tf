resource "aws_s3_bucket" "demo_bucket" {
  bucket = "finops-demo-bucket-12345"

  tags = {
    Environment = var.environment
    Project     = "finops-demo"
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.demo_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}
