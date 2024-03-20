resource "aws_instance" "ec2_instance" {
  count         = 1
  ami           = var.image_id
  instance_type = "t2.micro"
}

resource "aws_instance" "ec2_instance_1" {
  count         = 1
  ami           = var.another_image_id
  instance_type = "t2.micro"
}

resource "aws_instance" "ec2_instance_2" {
  count         = 1
  ami           = var.valid_image_id
  instance_type = "t2.micro"
}
