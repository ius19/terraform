variable "region" {
  default = "ap-south-1"
}

# access key for uday_admin user

variable "access_key" {
  default = "<give the access key for the user>"
}

# secret key for uday_admin user

variable "secret_key" {
  default = "<give the secret key for the user>"
}

# name of the ec2 instance

variable "instance_name" {
  default = "vm2"
}

# ubuntu 18.0.4 

variable "ami" {
  default = "ami-0cfedf42e63bba657"
}

# keypair name stored in aws

variable "key_name" {
  default = "<key name>"
}

variable "cidr_block" {
  default = "10.0.0.0/16"
}