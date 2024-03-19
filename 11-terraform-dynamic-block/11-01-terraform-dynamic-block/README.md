# Terraform dynamic block

## Steps to run
  - cd 07-terraform-conditional-expression
  - terraform init
  - terraform validate
  - terraform plan
  - terraform apply --auto-approve
  - terraform destroy --auto-approve
  - rm *terraform*

##  dynamic block
  - dynamic block helps to reduce code for repeatitive code block.
##  Demo use case
  - Create security group with ingress and egress rules with repeatition
  - Use dynamic block and see the repetition is not required due to dynamic code block generation