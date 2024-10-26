variable "ami_id" {
  description = "The AMI ID to use for the instance"
  type        = string
  default     = "ami-06b21ccaeff8cd686"
}

variable "instance_tag_name" {
  description = "The name to assign to the instance"
  type        = string
  default     = "terraform"
}

// Additional variable declarations remain the same
