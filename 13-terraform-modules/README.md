# Terraform modules

## Steps to run
  - cd 13-terraform-modules
  - terraform init
  - terraform validate
  - terraform plan
  - terraform apply --auto-approve
  - terraform destroy --auto-approve
  

## Module concepts
  - Module is a way in terraform to package and reuse the configurations. In genral, it consists of .tf file collections - input variables, output values, resources to define one or more infrastructure objects. 
### Use Case demonstration
  - Create a S3 module and call it from root module.