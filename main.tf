terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "<=4.56.0"
    }
  }
}

provider "aws" {
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_KEY
}


module "instance-us-east-1-ubuntu" {
  source        = "./modules/aws-instance"
  instance_name = "ubuntu"
  instance_type = "t2.micro"
  region        = "us-east-1"
  linux_flavour = "ubuntu"
}

module "instance-ap-south-1-amazon_linux" {
  source        = "./modules/aws-instance"
  instance_name = "amazon_linux"
  instance_type = "t2.micro"
  linux_flavour = "amazon_linux"
  region        = "ap-south-1"
}


output "ip_ap-south-1" {
  value = module.instance-ap-south-1-amazon_linux.IP_Address
}

output "ip_us-east-1" {
  value = module.instance-us-east-1-ubuntu.IP_Address
}