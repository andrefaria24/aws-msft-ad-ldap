output "Deployment_Status" {
  value = <<-EOF
    ================================================================
    DEPLOYMENT STARTED SUCCESSFULLY
    ================================================================
    Server IP:     ${aws_eip.server_ip.public_ip}
    Domain:        ${var.domain_name}
    Subnet CIDR:   ${data.terraform_remote_state.aws-demo-network.outputs.vpc_cidr}
    Username:      Administrator
    Password:      ${nonsensitive(local.final_password)}
    CA Cert:       Saved to 'ca.pem'
    
    PLEASE WAIT ~10-15 MINUTES FOR INSTALLATION TO COMPLETE.

    --- CONNECTION COMMANDS ---

    1. STRICT VALIDATION (Use CA File):
    LDAPTLS_CA_CERT=ca.pem ldapsearch \
      -vvv -x \
      -H ldaps://${aws_eip.server_ip.public_ip}:636 \
      -D "cn=Administrator,cn=Users,${local.dc_formatted}" \
      -w "${nonsensitive(local.final_password)}" \
      -b "${local.dc_formatted}" \
      -s sub

    2. INSECURE VALIDATION (Ignore CA):
    LDAPTLS_REQCERT=never ldapsearch \
      -vvv -x \
      -H ldaps://${aws_eip.server_ip.public_ip}:636 \
      -D "cn=Administrator,cn=Users,${local.dc_formatted}" \
      -w "${nonsensitive(local.final_password)}" \
      -b "${local.dc_formatted}" \
      -s sub

    3. MACOS FIX (Import CA to System Keychain):
    sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain ca.pem
    ================================================================
  EOF
}