# Terraform sns lambda trigger

## Steps to run
  - cd 17-sns-lambda-trigger
  - terraform init
  - terraform validate
  - terraform plan
  - terraform apply --auto-approve
  - terraform destroy --auto-approve
  - rm -r .terraform*
  - rm -r terraform.tfstate*
   

## Use Case demonstration
  - Create a Lambda Function, Lambda execution role
  - Create resource policy to give an external source (like an EventBridge Rule, SNS, or S3) permission to access the Lambda function using aws_lambda_permission.
  
