# Active Directory with LDAP
## What's this?
This Terraform project deploys a Windows server in AWS and automatically installs and configures Active Directory, LDAP, and LDAPS for use with HashiCorp Vault.

## What does it provide?
- LDAP connectivity on TCP port `389`
- LDAPS connectivity on TCP port `636`
- RDP connectivity on TCP port `3389`

**PLEASE NOTE:** 
- The default security group allows only the source IP of the system (public exit point) where the TF project was applied.
- The Default Domain Controllers Policy in AD has been altered to allow all users RDP access to the server.

## Prerequisites
- Terraform installed
- AWS Credentials (exported as environment variables or `credentials` file)

## Usage
### Check
- Create a `terraform.tfvars` and set the variables to match your environment.
```
aws_region ="us-west-2"
password = "" // Only set a value if you don't want a randomly generated password for the domain controller, otherwise the password set here will be used. Make sure it conforms to Microsoft Complexity Requirements.
domain_name = "adldap.lab"
instance_type = "t3.large"
```

### Deploy
- `terraform apply`
- It takes around 10 - 15 minutes for the deployment to complete.
- Once complete, RDP connections to the EC2 instance **are** possible, as well as sending LDAP and LDAPS queries.

### Connection Commands

The following examples demonstrate how to connect to the LDAPS endpoint. Replace the Terraform interpolation syntax with actual values from your `terraform output`.

#### STRICT VALIDATION (Recommended - Uses CA Certificate)
This method validates the server's SSL certificate against the CA certificate file for secure connections:
          LDAPTLS_CA_CERT=ca.pem ldapsearch \
          -vvv -x \
          -H ldaps://${aws_eip.server_ip.public_ip}:636 \
          -D "cn=Administrator,cn=Users,${local.dc_formatted}" \
          -w "${nonsensitive(local.final_password)}" \
          -b "${local.dc_formatted}" \
          -s sub

#### INSECURE VALIDATION (Not Recommended - Ignores CA Certificate)
This method bypasses SSL certificate validation. **Use only for testing purposes:**
          LDAPTLS_REQCERT=never ldapsearch \
          -vvv -x \
          -H ldaps://${aws_eip.server_ip.public_ip}:636 \
          -D "cn=Administrator,cn=Users,${local.dc_formatted}" \
          -w "${nonsensitive(local.final_password)}" \
          -b "${local.dc_formatted}" \
          -s sub

### Destroy
`terraform destroy`
