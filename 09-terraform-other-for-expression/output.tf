locals {
    regions_map = {for k,v in var.az_zone_map: k=>[for s in lookup(v,"az_zone_name_suffix"): "${k}${s}"]}
}
output "list_map" {
    value = {for s in var.availability_zones: s=>upper(s)}
}

output "regions_map" {
    value = {for k,v in var.az_zone_map: k=>[for s in lookup(v,"az_zone_name_suffix"): "${k}${s}"]}
}
output "us_regions_map" {
    value = {for key in keys(local.regions_map): key => lookup(local.regions_map,key) if startswith(key,"us-")}
}