terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-west-2"
}

###creat VPC
resource "aws_vpc" "davids" {
  cidr_block       = "10.0.0.0/16"
  tags = {
    Name = "davids"
  }
}

###creat Web-subnet
resource "aws_subnet" "Web_subnet" {
  vpc_id = aws_vpc.davids.id
  cidr_block       = "10.0.0.0/27"
  tags = {
    Name = "Web_subnet"
  }
}

###creat App-subnet
resource "aws_subnet" "App_subnet" {
    vpc_id = aws_vpc.davids.id
  cidr_block       = "10.0.0.32/27"
  tags = {
    Name = "App_subnet"
  }
}

###creat DB-subnet
resource "aws_subnet" "DB_subnet" {
    vpc_id = aws_vpc.davids.id
  cidr_block       = "10.0.0.64/28"
  tags = {
    Name = "DB_subnet"
  }
}
