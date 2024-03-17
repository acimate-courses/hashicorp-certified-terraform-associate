# Terraform for expressions other examples

## Steps to run
  - cd 07-terraform-conditional-expression
  - terraform init
  - terraform validate
  - terraform plan
  - terraform apply --auto-approve
  - terraform destroy --auto-approve
  - rm *terraform*


##  Demo use case
  - list_map -> Create a map from the list of availability zones applying upper function on the string
  - regions_map -> creates the map dynamically appling the region and suffix
  - us_regions_map -> filters the keys started with 'us-' and returns those specific keys
  - also notice the order of the map returns - it is not in the order the source map. Terraform implkcitly returns sorted order alphabatically.