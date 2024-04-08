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
    - aws_api_gateway_rest_api
    - aws_api_gateway_resource
    - aws_api_gateway_method
    - aws_api_gateway_integration
    - aws_api_gateway_method_response
    - aws_api_gateway_integration_response
    - aws_api_gateway_deployment
    - aws_api_gateway_resource
    - aws_cognito_user_pool
    - aws_cognito_user_pool_client
    - aws_cognito_user
    - aws_api_gateway_authorizer
    - aws_api_gateway_method ( update for athorizer)
    - Generate tokenId - aws cognito-idp admin-initiate-auth --user-pool-id <USER_POOL_ID> --client-id <CLIENT_ID> --auth-flow ADMIN_NO_SRP_AUTH --auth-parameters USERNAME=sumeet.n,PASSWORD=Test@123
    - aws_route53_zone
    - aws_route53_record
    - aws_acm_certificate
    - Ref doc - https://spacelift.io/blog/terraform-api-gateway
