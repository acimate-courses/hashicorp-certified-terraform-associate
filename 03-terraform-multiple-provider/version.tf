# Terraform Block
terraform {
  required_version = ">= 1.4.1"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
}

# Provider Block
provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

# Provider Block
provider "aws" {
  region  = "us-east-2"
  profile = "default"
  alias   = "east2"
}
