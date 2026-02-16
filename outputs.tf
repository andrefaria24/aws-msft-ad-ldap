output "server_ip" {
  value = aws_eip.server_ip.public_ip
}

output "domain_name" {
  value = var.domain_name
}

output "subnet_cidr" {
  value = data.terraform_remote_state.aws-demo-network.outputs.vpc_cidr
}

output "admin_username" {
  value = "Administrator"
}

output "admin_password" {
  value     = local.final_password
  sensitive = true
}