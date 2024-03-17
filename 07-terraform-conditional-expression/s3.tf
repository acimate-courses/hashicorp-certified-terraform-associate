resource "aws_s3_bucket" "acimate_test_bucket" {
  bucket   = "${var.org_prefix}-${var.bucket_name}"  
}

resource "aws_s3_bucket_versioning" "acimate_test_bucket" {
  bucket = aws_s3_bucket.acimate_test_bucket.id

  versioning_configuration {
    status = var.bucket_version_config ? "Enabled" : "Disabled"
  }
}

