# Terraform API Gateway and Lambda integration

## Steps to run
  - cd 22-terraform-api-gatewat-lambda
  - terraform init
  - terraform validate
  - terraform plan
  - terraform apply --auto-approve
  - terraform destroy --auto-approve
  - rm -r .terraform*
  - rm -r terraform.tfstate*
   

## Use Case demonstration
  - Create Lambda, IAM role and Lambda Permission
  - Create API Gateway Resources
  - Open API Gateway URL from browser and verify the response
  - https://spacelift.io/blog/terraform-api-gateway
  - Follow further steps to create user/authentication/domain mapping.
  - Generate token - 
aws cognito-idp admin-initiate-auth --user-pool-id <id>> --client-id <id>> --auth-flow ADMIN_NO_SRP_AUTH --auth-parameters USERNAME=<uname>,PASSWORD=<param>

    
  
