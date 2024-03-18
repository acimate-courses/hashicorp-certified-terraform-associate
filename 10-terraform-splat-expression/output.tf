output "host_names_1" {
    value = [for s in var.host_names:s]
}
output "host_names_2" {
    value = [var.host_names[*]]
}

output "host_details_ip_1" {
    value = [for s in var.host_details:s.host_id]
}

output "host_details_ip_2" {
    value = [var.host_details[*].host_id]
}
