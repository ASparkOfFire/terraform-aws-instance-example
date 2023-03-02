variable "region" {
  type        = string
  description = "The region to create instance in."
  default     = "ap-south-1"
}

variable "instance_name" {
  type        = string
  description = "The name of the instance."
  default     = "terraform-aws-instance-module"
}

variable "instance_type" {
  type        = string
  description = "The size (shape) of the instance."
  default     = "t2.micro"
}

variable "linux_flavour" {
  type    = string
  default = "ubuntu"
}

variable "amis" {
  type = map(map(string))
  default = {
    "ubuntu"       = { "ap-south-1" = "ami-0025f9fcfdae2458c", "us-east-1" = "ami-0e2162f7f3582e92f" },
    "amazon_linux" = { "ap-south-1" = "ami-09ba48996007c8b50", "us-east-1" = "ami-006dcf34c09e50022" }
  }
}