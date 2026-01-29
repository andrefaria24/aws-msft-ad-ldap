variable "aws_region" {
  description = "The AWS region to deploy into (e.g., eu-central-1, us-east-1)"
  type = string
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
  default     = "t3.medium"
}