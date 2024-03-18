# Terraform splat expression

## Steps to run
  - cd 07-terraform-conditional-expression
  - terraform init
  - terraform validate
  - terraform plan
  - terraform apply --auto-approve
  - terraform destroy --auto-approve
  - rm *terraform*

##  Splat Expression
  - A splat expression provides a more concise way to express a common operation that could otherwise be performed with a for expression.
  - [for o in var.list : o.id] -> This is for expression and equivalent splat expression is like - 
    var.list[*].id
  - Resources that use the for_each argument will appear in expressions as a map of objects, so you   can't use splat expressions with those resources. In those cases, you must use for expressions.

##  Demo use case
  - list_map -> Create a map from the list of availability zones applying upper function on the string
  - regions_map -> creates the map dynamically appling the region and suffix
  - us_regions_map -> filters the keys started with 'us-' and returns those specific keys
  - also notice the order of the map returns - it is not in the order the source map. Terraform implkcitly returns sorted order alphabatically.