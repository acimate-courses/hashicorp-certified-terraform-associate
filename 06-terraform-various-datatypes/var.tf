variable "org_prefix" {
    type = string
    default = "acimate"
    description = "name of the organization prefix"
}
variable "bucket_names" {
    type = list(string)
    default = ["retail-bu-raw-data","finance-bu-raw-data","hr-bu-raw-data","retail-bu-processed-data","finance-bu-processed-data","hr-bu-processed-data"]
    description = "name of applicable buckets for the org"
}
variable "block_public_acls_config"{
    type = bool
    default = true
}
variable "block_public_policy_config"{
    type = bool
    default = true
}
variable "ignore_public_acls_config"{
    type = bool
    default = true
}
variable "restrict_public_buckets_config"{
    type = bool
    default = true
}

variable common_tag_map{
    type = map(string)
    default = {
        datacategory = "sentisitve"
        datausage = "reporting"
    }
}

variable bu_specific_tag_map{
    type = map(object({
        bu_name = string
        owner = string
        cost_center = number
    }
    ))
    default = {
        retail = {
            bu_name = "retail_apps"
            owner = "retail@acimate.com"
            cost_center = 1111
        }
        finance = {
            bu_name = "financial_apps"
            owner = "finance@acimate.com"
            cost_center = 2222
        }
        hr = {
            bu_name = "hr_apps"
            owner = "hr@acimate.com"
            cost_center = 3333
        }

    }
}
