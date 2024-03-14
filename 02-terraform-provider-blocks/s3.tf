resource "aws_s3_bucket" "acimate_test_bucket" {
  bucket = "my-tf-test-bucket-00909"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}