variable "org_prefix" {
    type = string
    default = "acimate"
    description = "name of the organization prefix"
}

variable "image_id" {
  type        = string
  description = "The id of the machine image (AMI) to use for the server."
  default = "noami-02d7fd1c2af6eead0"
  validation {
    condition     = length(var.image_id) > 4 && substr(var.image_id, 0, 4) == "ami-"
    error_message = "The image_id value must be a valid AMI id, starting with \"ami-\"."
  }
}

variable "another_image_id" {
  type        = string
  description = "The id of the machine image (AMI) to use for the server."
  default = "noami-02d7fd1c2af6eead0"

  validation {
    # regex(...) fails if it cannot find a match
    condition     = can(regex("^ami-", var.another_image_id))
    error_message = "The image_id value must be a valid AMI id, starting with \"ami-\"."
  }
}

variable "valid_image_id" {
  type        = string
  description = "The id of the machine image (AMI) to use for the server."
  default = "ami-02d7fd1c2af6eead0"
  validation {
    condition     = can(regex("^ami-", var.valid_image_id))
    error_message = "The image_id value must be a valid AMI id, starting with \"ami-\"."
  }
}
