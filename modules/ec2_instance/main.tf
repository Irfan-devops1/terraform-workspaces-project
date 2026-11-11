provider "aws" {
  region = "ap-south-1"
}

variable "ami" {
    description = "This is ami for the Instance"
    
  
}

variable "instance_type" {
    description = "This is type for the Instance"
}

variable "instance_name" {
    description = "Name of EC2 Instances"
  
}
  
resource "aws_instance" "example" {
    ami = var.ami
    instance_type = var.instance_type
    tags = {
        Name = var.instance_name
    }

  }

