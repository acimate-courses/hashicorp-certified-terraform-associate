variable "org_prefix" {
    type = string
    default = "acimate"
    description = "name of the organization prefix"
}
variable "bucket_name" {
    type = string
    default = "retail-sales"
    description = "name of the bucket"
}
variable "environment" {
    type = string
    default = "Dev"
    description = "Deployment Environment Name"
}