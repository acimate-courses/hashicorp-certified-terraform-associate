resource "aws_s3_bucket" "acimate_test_bucket" {
  bucket   = "${var.org_prefix}-${var.bucket_name}"

  tags = {
    Name        = "My bucket1"
    Environment = "Dev"
  }
}
