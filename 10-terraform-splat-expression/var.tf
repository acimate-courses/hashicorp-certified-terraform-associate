variable "org_prefix" {
    type = string
    default = "acimate"
    description = "name of the organization prefix"
}
variable "host_names" {
    type = list(string)
    default = ["host-1","host-2","host-3"]
}

variable "host_details" {
    type = list(
    object({
      host_id = string,
      host_name    = string,      
    })
  )

    default = [
        {
            host_id = "10.0.0.1"
            host_name = "host-1"
        },
        {
            host_id = "10.0.2.2"
            host_name = "host-2"
        },
        {
            host_id = "10.0.0.3"
            host_name = "host-3"
        },
        {
            host_id = "10.0.0.4"
            host_name = "host-4"
        },

    ]
}
