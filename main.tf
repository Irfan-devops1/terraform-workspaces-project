provider "aws" {
  region = "ap-south-1"

}

variable "ami" {
  description = "AMI ID for EC2 instance"
}
variable "instance_type" {
  description = "Instance types for different environments"
  type        = map(string)
  
  default = {
    "dev" = "t3.micro"
    "stage" = "t3.small"
    "prod" =  "t8i.small"
  }


}
module "ec2_instance" {
  source        = "./modules/ec2_instance"
  ami           = var.ami
  instance_type = lookup(var.instance_type, terraform.workspace, "t3.small")
  instance_name = "${terraform.workspace}_instance"
}