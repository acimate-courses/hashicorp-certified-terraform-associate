resource "aws_s3_bucket" "acimate_test_bucket2" {
  bucket   = "my-tf-test-bucket-00909-east1"

  tags = {
    Name        = "My bucket1"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket" "acimate_test_bucket1" {
  bucket   = "my-tf-test-bucket-00909-east2"
  provider = aws.east2

  tags = {
    Name        = "My bucket2"
    Environment = "Test"
  }
}