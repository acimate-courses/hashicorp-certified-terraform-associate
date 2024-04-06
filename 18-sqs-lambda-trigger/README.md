# Terraform sqs lambda trigger

## Steps to run
  - cd 18-sqs-lambda-trigger
  - terraform init
  - terraform validate
  - terraform plan
  - terraform apply --auto-approve
  - terraform destroy --auto-approve
  - rm -r .terraform*
  - rm -r terraform.tfstate*
   

## Use Case demonstration
  - Create a Lambda Function, Lambda execution role
  - Create SQS.
  - Create SQS event Sourcing
  - Make sure visibility_timeout_seconds in sqs must be great than lambda timeout
  - Common problem faced - in the Lambda IAM role, for the log group resource, initially below is used
    resources = ["${aws_cloudwatch_log_group.lambda_lg.arn}"] and lambda could not write logs, be care ful to write as below
    resources = ["${aws_cloudwatch_log_group.lambda_lg.arn}:*"]
    
  
