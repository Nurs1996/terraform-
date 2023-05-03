provider "aws" {
 region = var.region
}
# Create VPC
resource "aws_vpc" "main" {
 cidr_block = var.vpc_cidr_block
 tags = {
  Name = "${var.name}-vpc"
 }
}
resource "aws_subnet" "public" {
 vpc_id = aws_vpc.main.id
cidr_block = var.public_subnet_cidr_block
 availability_zone = "${var.region}a"
 tags = {
  Name = "${var.name}-public-subnet"
 }
}
# Create private subnet
resource "aws_subnet" "private" {
 vpc_id = aws_vpc.main.id
 cidr_block = var.private_subnet_cidr_block
 availability_zone = "${var.region}a"
 tags = {
  Name = "${var.name}-private-subnet"
 }
}
# Create Internet Gateway
resource "aws_internet_gateway" "main" {
 vpc_id = aws_vpc.main.id
 tags = {
  Name = "${var.name}-ig"
 }
}
# Create Route Table for public subnet
resource "aws_route_table" "public" {
 vpc_id = aws_vpc.main.id
 route {
  cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.main.id
 }
 tags = {
  Name = "${var.name}-public-rt"
 }
}
# Associate public subnet with public route table
resource "aws_route_table_association" "public" {
 subnet_id = aws_subnet.public.id
 route_table_id = aws_route_table.public.id
}
# Create EC2 instance in private subnet
resource "aws_instance" "main" {
 ami = var.ami
 instance_type = var.instance_type
 subnet_id = aws_subnet.private.id
 key_name = var.key_name
 tags = {
  Name = "${var.name}-ec2"
 }
}
# Create S3 backend for storing state file
terraform {
 backend "s3" {
  bucket = var.bucket
  key  = "${var.name}/terraform.tfstate"
  region = var.backend_region
 }
}


