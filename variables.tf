variable "ami_id" {
  description = "The AMI ID to use for the instance"
  default     = "ami-06b21ccaeff8cd686"
}

variable "instance_tag_name" {
  description = "The name to assign to the instance"
  default     = "terraform"
}

variable "subnet_id" {
  description = "The subnet ID to launch the instance in"
  default     = "subnet-09dc057c84389ffcb"
}

variable "vpc_id" {
  description = "The VPC ID to use"
  default     = "vpc-006993ee517a74e91"
}

variable "vpc_cidr" {
  description = "The CIDR block of the VPC"
  default     = "172.31.0.0/16"
}
