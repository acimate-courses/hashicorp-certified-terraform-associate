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
        #resources = ["arn:aws:logs:*:*:*"]
        resources = ["${aws_cloudwatch_log_group.lambda_lg.arn}:*"]
    }
    statement {
        sid = "AllowReceiveMsgFromQSQ"
        actions = [
            "sqs:ReceiveMessage",
            "sqs:DeleteMessage",
            "sqs:GetQueueAttributes"
        ]
        resources = [aws_sqs_queue.acimate_test_sqs.arn]
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
    timeout = 100
    memory_size = 128        
    source_code_hash = data.archive_file.lambda_source_zip.output_base64sha256
}

resource "aws_sqs_queue" "acimate_test_sqs" {
  name                       = "acimate-test-sqs"
#   delay_seconds              = var.sqs_delayseconds 
#   max_message_size           = var.max_message_size 
#   message_retention_seconds  = var.message_retention_seconds
    visibility_timeout_seconds = var.visibility_timeout_seconds 
#   receive_wait_time_seconds  = var.receive_wait_time_seconds
}

resource "aws_lambda_event_source_mapping" "acimate_lambda_test_sqs_trigger" {
  event_source_arn = aws_sqs_queue.acimate_test_sqs.arn
  function_name    = aws_lambda_function.acimate_test.arn
}
