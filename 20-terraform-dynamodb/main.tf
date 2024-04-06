resource "aws_dynamodb_table" "acimate_dynamodb_table" {
  name           = "acimate-blogs"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "user-id"
  range_key      = "title"

  attribute {
    name = "user-id"
    type = "S"
  }

  attribute {
    name = "title"
    type = "S"
  }

  ttl {
    attribute_name = "TimeToExist"
    enabled        = false
  }

  tags = {
    Name        = "dynamodb-table-1"
    Environment = "production"
  }
}
