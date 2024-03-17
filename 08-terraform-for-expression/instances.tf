resource "aws_instance" "ec2_instance" {
  count         = length(var.availability_zones)
  ami           = "ami-02d7fd1c2af6eead0"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.acimate_test_subnet[count.index].id

  tags = {
    Name = "${var.org_prefix}-instance-${count.index}"
  }
}