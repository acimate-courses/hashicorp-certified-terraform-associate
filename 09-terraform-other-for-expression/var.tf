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

variable az_zone_map {
    type = map(object({        
        az_zone_name_suffix = list(string)
    }))
    default= {
        us-east-1:{
            az_zone_name_suffix = ["a","b","c"]
        }
        us-east-2:{
            az_zone_name_suffix = ["a","b","c"]
        }
        us-west-1:{
            az_zone_name_suffix = ["a","b","c"]
        }
        us-west-2:{
            az_zone_name_suffix = ["a","b","c"]
        }
        ap-south-1:{
            az_zone_name_suffix = ["a","b","c"]
        }
        ap-south-2:{
            az_zone_name_suffix = ["a","b","c"]
        }
        ap-east-1:{
            az_zone_name_suffix = ["a","b","c"]
        }
        ap-southeast-1:{
            az_zone_name_suffix = ["a","b","c"]
        }
        ap-southeast-2:{
            az_zone_name_suffix = ["a","b","c"]
        }
        ap-southeast-3:{
            az_zone_name_suffix = ["a","b","c"]
        }
        ap-southeast-4:{
            az_zone_name_suffix = ["a","b","c"]
        }
        ap-northeast-1:{
            az_zone_name_suffix = ["a","b","c"]
        }
        ap-northeast-2:{
            az_zone_name_suffix = ["a","b","c"]
        }
        ap-northeast-3:{
            az_zone_name_suffix = ["a","b","c"]
        }
    }
}