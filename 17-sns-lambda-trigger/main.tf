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

resource "aws_lambda_permission" "allow_sns" {
  statement_id  = "AllowExecutionFromSNS"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.acimate_test.function_name
  principal     = "sns.amazonaws.com"
  source_arn    = aws_sns_topic.acimate_test_sns.arn
}

resource "aws_sns_topic" "acimate_test_sns" {
  name = "acimate-test-sns-topic"
}

resource "aws_sns_topic_subscription" "acimate_test_sns" {
  topic_arn = aws_sns_topic.acimate_test_sns.arn
  protocol  = "lambda"
  endpoint  = aws_lambda_function.acimate_test.arn
}

