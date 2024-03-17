variable "org_prefix" {
    type = string
    default = "acimate"
    description = "name of the organization prefix"
}
variable "bucket_name" {
    type = string
    default = "retail-bu-raw-data"
}
variable "bucket_version_config" {
    type = bool
    default = true
}
