terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

<<<<<<< HEAD
provider "docker" { 
    registry_auth { 
        address = data.aws_ecr_authorization_token.ecr_token.proxy_endpoint 
        username = data.aws_ecr_authorization_token.ecr_token.user_name 
        password = data.aws_ecr_authorization_token.ecr_token.password 
    } 
}

data "aws_ecr_authorization_token" "ecr_token"{} 
=======
provider "aws" {
  region                   = "us-east-1"
  shared_credentials_files = ["./credentials"]
  default_tags {
    tags = {
      Course     = "CSSE6400"
      Name       = "TaskOverflow"
      Automation = "Terraform"
    }
  }
}

# used for database
locals {
  image             = docker_registry_image.taskoverflow.name
  database_username = "administrator"
  database_password = "VerySecurePassword123XYZ"
}

# Docker token
data "aws_ecr_authorization_token" "ecr_token" {}

# ECS access
data "aws_iam_role" "lab" {
  name = "LabRole"
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "private" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}
>>>>>>> combine
