module "lambda"{
    source = "../14-terraform-modules-lambda/modules/lambda"
    lambda_function_name = var.lambda_function_name
    org_prefix = var.org_prefix    
}

