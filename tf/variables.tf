variable "aws_region" {
	default = "eu-west-1"
}

variable "vpc_cidr" {
	default = "10.0.0.0/23"
}

variable "vpc_cidr_az1" {
	default = "10.0.0.0/24"
}

variable "vpc_name" {
	default = "hosting_env"
}

variable "owner" {
	default = ""
}

variable "project" {
	default = ""
}

variable "environment" {
	default = ""
}

variable "core_ami" {
	default = "ami-79fccb1f"
}
