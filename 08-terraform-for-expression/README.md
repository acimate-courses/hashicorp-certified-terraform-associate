# Terraform for expressions

## Steps to run
  - cd 07-terraform-conditional-expression
  - terraform init
  - terraform validate
  - terraform plan
  - terraform apply --auto-approve
  - terraform destroy --auto-approve
  - rm *terraform*

## for expression
  - It creates a complex type value by transforming another complex type value.
  - A for expression's input (given after the in keyword) can be a list, a set, a tuple, a map, or an object.
  - The type of brackets around the for expression decide what type of result it produces.
  - A for expression can also include an optional if clause to filter elements from the source collection.

##  Demo use case
  - availability_zone = var.availability_zones[count.index] -> This fetches each availability zone from the list variables.
  - availability_zone = local.azs[count.index] -> variables here is taken as AZs suffix like 'a','b','c'.
    inside locals using for expression it is concatenated with region variable and get zone as 'us-east-1a','us-east-1b','us-east-1a'