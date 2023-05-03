variable "region" {
    description = "Enter the region"
    type = string
    default = ""
}
variable "vpc_cidr_block" {
 default = "10.0.0.0/16"
}
variable "public_subnet_cidr_block" {
 default = "10.0.1.0/24"
}
variable "private_subnet_cidr_block" {
 default = "10.0.2.0/24"
}
variable "name" {
 default = "myenv"
}
variable "ami" {
 default = "ami-0c55b159cbfafe1f0"
}
variable "instance_type" {
 default = "t2.micro"
}
variable "key_name" {
 default = ""
}
variable "bucket" {
 default = ""
}
variable "backend_region" {
 default = ""
}
variable "key_file" {
description = "Enter public key location"
type = string
default = "~/.ssh/id_rsa.pub"
}

