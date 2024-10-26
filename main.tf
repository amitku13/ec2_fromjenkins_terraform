provider "aws" {
  region = "ap-south-1"
}

variable "ami_id" {
  description = "AMI ID to use for the EC2 instance"
  default     = "ami-06b21ccaeff8cd686" // Default AMI ID
}

variable "instance_tag_name" {
  description = "Name tag for the EC2 instance"
  default     = "terraform" // Default instance tag name
}

variable "subnet_id" {
  description = "Subnet ID where the EC2 instance will be launched"
  default     = "subnet-09dc057c84389ffcb" // Default subnet ID
}

variable "vpc_id" {
  description = "VPC ID where the EC2 instance will be launched"
  default     = "vpc-006993ee517a74e91" // Default VPC ID
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "172.31.0.0/16" // Default VPC CIDR
}

resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = "t2.micro"
  subnet_id     = var.subnet_id
  tags = {
    Name = var.instance_tag_name
  }
}
