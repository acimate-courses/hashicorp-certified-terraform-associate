# Terraform eventbridge lambda trigger

## Steps to run
  - cd 16-eventbridge-lambda-trigger
  - terraform init
  - terraform validate
  - terraform plan
  - terraform apply --auto-approve
  - terraform destroy --auto-approve
  - rm -r .terraform*
  - rm -r terraform.tfstate*
   

## Use Case demonstration
  - Create a Lambda Function, Lambda Permission
  - Create Eventbridge Rule and Target. This rule is created in default event bus in the account.
    You can create custom event bus and rule associated to it as well.        
  - Create resource policy to give an external source (like an EventBridge Rule, SNS, or S3) permission to access the Lambda function using aws_lambda_permission
  - For best practices, add DLQ to capture the failed event to target.
  - Troubleshooting guide - https://repost.aws/knowledge-center/eventbridge-lambda-not-triggered
  
