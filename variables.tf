variable "aws_region" {
  type    = string
  default = "us-east-1"
}


variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}


variable "public_subnets" {
  default = {
    "public_subnet_1" = 1
    "public_subnet_2" = 2
  }
}


variable "private_subnets" {
  default = {
    "private_subnet_1" = 1
    "private_subnet_2" = 2
  }
}

variable "key_name" {
  type        = string
  default     = "terraform-key-pair"
  description = "generated key pair"
}


variable "username" {
  default = "admin"
  type    = string
}

variable "password" {
  default = "admin12345"
  type    = string
}
