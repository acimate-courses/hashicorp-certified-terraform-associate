variable "org_prefix" {
    type = string
    default = "acimate"
    description = "name of the organization prefix"
}
variable "availability_zones" {
    type = list(string)
    default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "availability_zones_suffix" {
    type = list(string)
    default = ["a", "b", "c"]
}

variable "region" {
    type = string
    default = "us-east-1"
}
