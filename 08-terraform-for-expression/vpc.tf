locals {
  azs = [for zone_suffix in var.availability_zones_suffix: "${var.region}${zone_suffix}"]
}
###Create VPC
resource "aws_vpc" "acimate_test_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "acimate_test_vpc"
  }
}

#### Create Subnet
resource "aws_subnet" "acimate_test_subnet" {
  count             = length(var.availability_zones)
  vpc_id            = aws_vpc.acimate_test_vpc.id
  cidr_block        = cidrsubnet("10.0.0.0/16", 8, count.index)
  #availability_zone = var.availability_zones[count.index]
  availability_zone = local.azs[count.index]

  tags = {
    Name = "${var.org_prefix}-subnet-${count.index}"
  }
}


