resource "aws_s3_bucket" "app_data" {
  bucket = "${var.env}-app-data-bucket"
  tags = { Environment = var.env }
  
  # Force path-style addressing for LocalStack
  force_destroy = true
}

resource "aws_s3_bucket" "logs" {
  bucket = "${var.env}-logs-bucket" 
  tags = { Environment = var.env }
  
  # Force path-style addressing for LocalStack
  force_destroy = true
}

resource "aws_s3_bucket_versioning" "app_data" {
  bucket = aws_s3_bucket.app_data.id
  versioning_configuration { status = "Enabled" }
}
