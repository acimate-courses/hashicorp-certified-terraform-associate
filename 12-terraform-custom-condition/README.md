# Terraform custom condition block

## Steps to run
  - cd 07-terraform-conditional-expression
  - terraform init
  - terraform validate
  - terraform plan
  - terraform apply --auto-approve
  - terraform destroy --auto-approve
  - rm *terraform*

##  Input Variable Validation
  - Add one or more validation blocks within the variable block to specify custom conditions. Each validation requires a condition argument, an expression that must use the value of the variable to return true if the value is valid, or false if it is invalid.
  - If the condition evaluates to false, Terraform produces an error message that includes the result of the error_message expression. If you declare multiple validations, Terraform returns error messages for all failed conditions.
##  Preconditions and Postconditions
  - Preconditions and postconditions are available in Terraform v1.2.0 and later.
  - Use precondition and postcondition blocks to create custom rules for resources, data sources, and   outputs.
##  Checks with Assertions
  - Check blocks can validate your infrastructure outside the usual resource lifecycle. You can add custom conditions via assert blocks, which execute at the end of the plan and apply stages and produce warnings to notify you of problems within your infrastructure.
## Points to Note
  - During the apply phase, a failed precondition will prevent Terraform from implementing planned actions for the associated resource. However, a failed postcondition will halt processing after Terraform has already implemented these actions. The failed postcondition prevents any further downstream actions that rely on the resource, but does not undo the actions Terraform has already taken.