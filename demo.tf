terraform {
  backend "remote" {
    organization = "weavegrid-infrastructure"
    workspaces {
      name = "demo"
    }
  }
}

provider "aws" {
  profile    = "default"
  region     = "us-west-1"
}

resource "aws_instance" "demo1" {
  ami           = "ami-08fd8ae3806f09a08"
  instance_type = "t2.small"
}

resource "aws_eip" "ip_demo1" {
    vpc = true
    instance = aws_instance.demo1.id
}

resource "aws_instance" "demo2" {
  ami           = "ami-08fd8ae3806f09a08"
  instance_type = "t2.micro"
}

resource "aws_eip" "ip_demo2" {
    vpc = true
    instance = aws_instance.demo2.id
}

