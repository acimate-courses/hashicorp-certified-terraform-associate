# Terraform conditional expressions

## Steps to run
  - cd 07-terraform-conditional-expression
  - terraform init
  - terraform validate
  - terraform plan
  - terraform apply --auto-approve
  - terraform destroy --auto-approve
  - rm *terraform*

## Conditional expression
  - condition ? true_val : false_val
  - If condition is true then the result is true_val. If condition is false then the result is false_val.

##  Demo use case
  - Create a variable as version. Based on its value the versioning_configuration of the bucket is set to either 'Enabled' or 'Disabled'.
  - Once bucket is created, check the versioning - it is disabled. Now update the config parameter as true. Do terraform apply. Now, you can see the bucket versioning is enabled.