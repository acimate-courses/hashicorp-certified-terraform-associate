data "aws_ami" "example" {
  owners = ["amazon"]

  filter {
    name   = "image-id"
    values = ["ami-02d7fd1c2af6eead0"]
  }

  
  lifecycle {
    
    postcondition {
      condition     = self.architecture == "x86_64"
      #condition     = self.architecture == "arm_64"
      error_message = "architecture must be \"arm_64\"."
    }
  }
}


check "ami_architecture_check" {
  data "aws_ami" "example_1" {
  owners = ["amazon"]

  filter {
    name   = "image-id"
    values = ["ami-02d7fd1c2af6eead0"]
  }    
}

  assert {
    #condition = data.aws_ami.example_1.architecture == "x86_64" # correct
    condition = data.aws_ami.example_1.architecture == "arm_64" #error
    error_message = "AMI architecture- ${data.aws_ami.example_1.architecture} is wrong."
  }
}