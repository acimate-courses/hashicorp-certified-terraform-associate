# Terraform modules - Lambda

## Steps to run
  - cd 14-terraform-modules-lambda
  - terraform init
  - terraform validate
  - terraform plan
  - terraform apply --auto-approve
  - terraform destroy --auto-approve
  - rm -r .terraform*
  - rm -r terraform.tfstate*
  
  

## Use Case demonstration
  - Create a Lambda module. 
  - If you want to create the lambda package and download from s3 bucket or other https resurces
  - use the below pattern - https://github.com/terraform-aws-modules/terraform-aws-eventbridge/blob/master/examples/with-lambda-scheduling/main.tf
  - Call it from root module

