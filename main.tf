terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}

data "aws_iam_role" "existing_role" {
  name = "instance/iam_role" # Replace with the name of your existing role
}

data "aws_iam_instance_profile" "existing_instance_profile" {
  name = "instance/iam_role" # Assuming you have a data source fetching the existing role
}
data "aws_security_group" "existing_sg" {
  name = "security-group-name" # Replace with the name or ID of your existing security group
}

resource "aws_instance" "app_server" {
  ami           = "ami-04b70fa74e45c3917"
  instance_type = "t2.medium"
  key_name      = "key-pair-name" # replace with key-pair name

  root_block_device {
    volume_size = 50
  }
  
  vpc_security_group_ids = [data.aws_security_group.existing_sg.id]
  iam_instance_profile   = data.aws_iam_instance_profile.existing_instance_profile.name



  tags = {
    Name = "my-youtube-demo" # Name of the ec2 instance
  }
}
