locals {
  bu_owner        = "retail_team"
}

resource "aws_s3_bucket" "acimate_test_bucket" {
  #Example of string interpolation ${}
  # incorrect "${var.org_prefix}"-"${var.bucket_name}" 
  bucket   = "${var.org_prefix}-${var.bucket_name}"

  tags = {
    Name        = var.bucket_name
    Environment = var.environment
    owner = local.bu_owner
  }
}

resource "aws_s3_bucket_logging" "acimate_test_bucket" {
  bucket = aws_s3_bucket.acimate_test_bucket.id

  target_bucket = data.aws_s3_bucket.log_bucket.id
  target_prefix = "log/"
}
