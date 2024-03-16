# Terraform Configuration and syntax

## Syntax
- Low level syntax of the Terraform language is defined in terms of a syntax called HCL(HashiCorp Configuration Language)
- The terraform language syntax has 2 key constructs -
  - Blocks
  - Arguments
- Argument assigns particular value to a name. Syntax is <Argument_Name> = <Argument_Value>
  For example-

```t
bucket   = "my-tf-test-bucket-00909-east1"
```
However, but many arguments accept arbitrary expressions, which allow the value to either be specified literally or generated from other values programmatically.
- Block syntax has 2 parts - Block Type and One or many Block Labels.
- Terraform has following top level blocks.
  - resource [<TYPE> <LABEL1> <LABEL2>]
  ```t
  resource "aws_s3_bucket" "acimate_test_bucket2" {
  bucket   = "my-tf-test-bucket-00909-east1"  
  }
  ```
  - data [<TYPE> <LABEL1> <LABEL2>]
  ```t
  data "aws_s3_object" "bootstrap_script" {
  bucket = "ourcorp-deploy-config"
  key    = "ec2-bootstrap-script.sh"
  }
  ```
  - variable ( input ) [<TYPE> <LABEL1>]
  ```t
  variable "availability_zone_name" {
  type    = string
  default = "us-west-1a"
  }
  ```
  - output
  ```t
  output "instance_ip_addr" {
  value       = aws_instance.server.private_ip
  description = "The private IP address of the main server instance."
  }
  ```
  - locals
    - Local values are like a function's temporary local variables.- 
    - Local values are created by a locals block (plural), but you reference them as attributes on an   object named local (singular).
  
  ```t
  locals {
  service_name = "test_service"
  owner        = "finance_bu"
  }
  ```
    - Once a local value is declared, you can reference it in expressions as local.<NAME>

  - module
    - Modules are containers for multiple resources that are used together. A module consists of a collection of .tf and/or .tf.json files kept together in a directory.
    - Modules are the main way to package and reuse resource configurations with Terraform.
    - Every Terraform configuration has at least one module, known as its root module, which consists of the resources defined in the .tf files in the main working directory.
    - A Terraform module (usually the root module of a configuration) can call other modules to include their resources into the configuration. A module that has been called by another module is often referred to as a child module.
    - Child modules can be called multiple times within the same configuration, and multiple configurations can use the same child module.
    
