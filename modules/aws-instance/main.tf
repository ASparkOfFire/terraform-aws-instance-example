terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "<=4.56.0"
    }
  }
}

provider "aws" {
  region = var.region
  alias  = "aws_provider"
}

resource "aws_instance" "Terraform-Instance" {
  ami           = lookup(lookup(var.amis, var.linux_flavour), var.region)
  instance_type = var.instance_type
  provider      = aws.aws_provider

  tags = {
    "Name" = var.instance_name
  }
}

output "IP_Address" {
  value = aws_instance.Terraform-Instance.public_ip
}