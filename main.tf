provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "example" {
  ami           = "ami-06b21ccaeff8cd686" # Replace with your preferred AMI ID
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform-EC2"
  }
}

