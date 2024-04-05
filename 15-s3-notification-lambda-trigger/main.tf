resource "aws_cloudwatch_log_group" "lambda_lg"{
    name = "/aws/lambda/${var.org_prefix}-${var.lambda_function_name}"
    retention_in_days = 14
}

data "archive_file" "lambda_source_zip"{
    type = "zip"
    source_dir = "${path.module}/src/"
    output_path = "${path.module}/src/lambda.zip"
}
resource "aws_iam_role" "acimate_infra_lambda"{
    name = "${var.org_prefix}-${var.lambda_function_name}"
    assume_role_policy = jsonencode({
        Version = "2012-10-17",
        Statement = [
            {
              Effect = "Allow"
              Principal = {
                Service = "lambda.amazonaws.com"
              },
              Action = "sts:AssumeRole"
            }
        ]
    })
}

data "aws_iam_policy_document" "acimate_infra_lambda"{
    statement {
        sid = "AllowLogging"
        actions = [
            "logs:CreateLogGroup",
            "logs:CreateLogStream",
            "logs:PutLogEvents"
        ]
        resources = ["arn:aws:logs:*:*:*"]
    }

    statement {
        sid = "AllowReadBucket"
        actions = [
            "s3:ListBucket",
                "s3:PutObject",
                "s3:GetObjectAcl",
                "s3:GetObject",
                "s3:PutObjectVersionAcl",
                "s3:GetObjectTagging",
                "s3:DeleteObject",
                "s3:GetBucketLocation",
                "s3:PutObjectAcl"
        ]
        resources = ["arn:aws:s3:::acimate-${var.bucket_name}/*",
                    "arn:aws:s3:::acimate-${var.bucket_name}",
                    "arn:aws:s3:::acimate-img-processing/*",
                    "arn:aws:s3:::acimate-img-processing"
                    ]
    }
}

resource "aws_iam_policy" "acimate_infra_lambda"{
    name = "acimate-infra-lambda-policy"
    policy = data.aws_iam_policy_document.acimate_infra_lambda.json
}

resource "aws_iam_role_policy_attachment" "acimate_infra_lambda"{
    role = aws_iam_role.acimate_infra_lambda.name
    policy_arn = aws_iam_policy.acimate_infra_lambda.arn
}

resource "aws_lambda_function" "acimate_test"{
    filename = "${path.module}/src/lambda.zip"
    function_name = "${var.org_prefix}-${var.lambda_function_name}"
    role = aws_iam_role.acimate_infra_lambda.arn
    handler = "testlambda.lambda_handler"
    runtime = "python3.9"
    timeout = 300
    memory_size = 128
    source_code_hash = data.archive_file.lambda_source_zip.output_base64sha256
}

resource "aws_lambda_permission" "allow_bucket" {
  statement_id  = "AllowExecutionFromS3Bucket"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.acimate_test.function_name
  principal     = "s3.amazonaws.com"
  source_arn    = "arn:aws:s3:::${var.org_prefix}-${var.bucket_name}"
  #source_account is required for cross account permission.
}

resource "aws_s3_bucket" "acimate_test_bucket" {
  bucket   = "${var.org_prefix}-${var.bucket_name}"

  tags = {
    Name        = "My bucket1"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket" "acimate_img_processing_bucket" {
  bucket   = "${var.org_prefix}-img-processing"
  
  tags = {
    Name        = "My bucket1"
    Environment = "Dev"
  }
}

resource "aws_s3_object" "acimate_test_src_object"{
    bucket   = aws_s3_bucket.acimate_test_bucket.id
    key = "demo/upload/"
}

resource "aws_s3_object" "acimate_test_dest_object"{
    bucket   = aws_s3_bucket.acimate_img_processing_bucket.id
    key = "demo/raw/"
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.acimate_test_bucket.id

  lambda_function {
    lambda_function_arn = aws_lambda_function.acimate_test.arn
    events              = ["s3:ObjectCreated:*"]
    filter_prefix = "demo/upload/"
    filter_suffix = ".jpg"
  }
  depends_on = [aws_lambda_permission.allow_bucket]
}
