variable "aws_region" {
  description = "The AWS region to deploy into"
  type        = string
  default     = "us-west-2"
}

variable "password" {
  description = "Password for the domain controller"
  type        = string
}

variable "domain_name" {
  description = "Domain name for the Active Directory"
  type        = string
}

variable "instance_type" {
  description = "AWS instance type"
  default     = "t3.large"
  type        = string
}

variable "home_ip" {
  description = "Home IP Address for remote access"
  type        = string
}