# Terraform Aurora in Private Subnet

## Steps to run
  - cd 21-terraform-aurora-private-subnet
  - terraform init
  - terraform validate
  - terraform plan
  - terraform apply --auto-approve
  - terraform destroy --auto-approve
  - rm -r .terraform*
  - rm -r terraform.tfstate*
   

## Use Case demonstration
  - Create VPC, Subnets,NAT Gateway, Internet Gateway.
  - Create Aurora DB - Primary and Secondary
  - Reference - https://aws.amazon.com/blogs/infrastructure-and-automation/disaster-recovery-deploy-amazon-aurora-global-database-with-terraform/
  - https://github.com/aws-ia/terraform-aws-rds-aurora/blob/main/deploy/main.tf

    
  
