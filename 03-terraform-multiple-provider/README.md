# Terraform Provider Block

## Multiple Provider Configuration
- A provider configuration is created under provider block.
- The name given in provider block is the local name and should be included in the required_providers 
block.
- A provider block without an alias argument is the default configuration for that provider.
- Create multiple additional providers with an argument as alias name.
```t
provider "aws" {
  region = "us-east-1"  
  profile = "default" 
}
```
```t
provider "aws" {
  region  = "us-east-2"
  profile = "default"
  alias   = "east2"
}
```
