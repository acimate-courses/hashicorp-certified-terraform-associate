resource "aws_vpc" "vpc" {
    cidr_block = var.vpc-cidr
}

resource "aws_subnet" "main-subnet" {
    for_each = toset(var.vpc-subnets) 
    cidr_block = each.value
    vpc_id     = aws_vpc.vpc.id
}
