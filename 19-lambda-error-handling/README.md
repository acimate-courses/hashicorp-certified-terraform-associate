# Terraform lambda error handling

## Steps to run
  - cd 19-lambda-error-handling
  - terraform init
  - terraform validate
  - terraform plan
  - terraform apply --auto-approve
  - terraform destroy --auto-approve
  - rm -r .terraform*
  - rm -r terraform.tfstate*
   

## Use Case demonstration
  - Create a Lambda Function, Lambda execution role
  - Create DLQ, update Lambda Role policy to send message to DLQ.
  - This lambda error wont move to DLQ if you synchronous call from the console,
    to move error to DLQ, it requires asynchronous invokation, either from SQS or other sources.
    
  
