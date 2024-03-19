variable "org_prefix" {
    type = string
    default = "acimate"
    description = "name of the organization prefix"
}

# VPC variable
variable "vpc-cidr" {
   default = "10.0.0.0/16"
}
# Subnets variable
variable "vpc-subnets" {
    default = ["10.0.0.0/20","10.0.16.0/20","10.0.32.0/20"]
}