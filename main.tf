#
# DO NOT DELETE THESE LINES!
#
# Your subnet ID is:
#
#     subnet-51ab1e09
#
# Your security group ID is:
#
#     sg-01272d66
#
# Your AMI ID is:
#
#     ami-8328bbf0
#
# Your Identity is:
#
#     capgemini-eccbc87e4b5ce2fe28308fd9f2a7baf3
#
variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {
default = "eu-west-1"
}

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.aws_region}"
}
resource "aws_instance" "web" {
count = "2"
ami = "ami-8328bbf0"
instance_type =  "t2.micro"

subnet_id = "subnet-51ab1e09"
vpc_security_group_ids = ["sg-01272d66"]

tags {
Identity = "capgemini-eccbc87e4b5ce2fe28308fd9f2a7baf3"
}
}
output "public_ip" {
value = ["${aws_instance.web.*.public_ip}"]
}
output "public_dns" {
value = ["${aws_instance.web.*.public_dns}"]
}
