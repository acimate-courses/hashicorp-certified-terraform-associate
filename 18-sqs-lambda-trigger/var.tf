variable org_prefix {
    type = string
    default = "acimate"
}

variable lambda_function_name {
    type = string
    default = "finance-lambda"
}

variable sqs_delayseconds{
  type = number
  default = 5
}
variable max_message_size {
  type = number
  default = 2048
}
variable message_retention_seconds {
  type = number
  default = 86000
}
variable visibility_timeout_seconds{
  type = number
  default = 110
}
variable receive_wait_time_seconds{
  type = number
  default = 10
}
