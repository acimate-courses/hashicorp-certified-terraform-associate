# Terraform Provider Block

## Providers
- Providers allow Terraform to interact with cloud providers, SaaS providers, and other APIs. Providers are known as plugins.
- Without provider, Terraform can not manager any infrastructure. Every provider adds a set of resource types and/or data sources that Terraform can manage.
- Each provider has its own release and version number and it is distributed separately than Terraform itself.

## Provider Requirement
- Each terraform module must declare which provides it requires. Then Terraform can install and use it.
- Provider requirements are declared in 'required_providers' block.
- Provider requirement consists of 
    - a local name ( aws )
    - a source location ("hashicorp/aws")
    - a version constraint (">= 4.0")

```t
terraform {
  required_version = ">= 1.4.1"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
}
```
## Provider Configuration
- A provider configuration is created under provider block.
- The name given in provider block is the local name and should be included in the required_providers 
block.
- A provider block without an alias argument is the default configuration for that provider.
```t
provider "aws" {
  region = "us-east-1"  
  profile = "default" 
}
```