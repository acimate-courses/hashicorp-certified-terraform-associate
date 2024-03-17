# Terraform different data types

## Steps to run
  - cd 06-terraform-various-datatypes
  - terraform init
  - terraform validate
  - terraform plan
  - terraform apply --auto-approve
  - terraform destroy --auto-approve
  - rm *terraform*
## Data types
  - string - a sequence of Unicode characters representing some text, like "hello world"
  - number - a numeric value. The number type can represent both whole numbers like 15 and fractional values like 3.181199
  - bool - a boolean value, either true or false. 
  - list -  a sequence of values, like ["us-west-1a", "us-west-1c"]
  - set - a collection of unique values that do not have any secondary identifiers or ordering
  - map - a group of values identified by named labels

## Data Types examples
  - string  ( org_prefix variable is an exampel of string data type )
  - number  (cost_center in the map)
  - bool (block_public_acls_config , block_public_policy_config, ignore_public_acls_config, restrict_public_buckets_config)
  - list (bucket_names is a list of string)
  - map (common_tag_map is a map of string and bu_specific_tag_map is map of object)

