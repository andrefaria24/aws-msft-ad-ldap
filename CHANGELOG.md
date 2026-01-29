## [2026-01-29]
### Added
- **TF Provider** Explicitly declared `hashicorp/http`
  
### Changed
- **Public repo** Created public repo

### Removed
- `hashicorp/template` provided removed - deprecated and no longer used.


## [2026-01-14]
### Added
- **Automation:** Moved from a manual `install.ps1` script to `user_data` deployment execution.
- **LDAPS Support:** Added `hashicorp/tls` provider for internal PKI (Root CA + Server Cert).
- **Dynamic AMI:** Automated lookup for Windows Server 2022.
- **Elastic IP:** Added `aws_eip` for persistent IP addressing.
- **Password Generation:** A random password is generated if no value is set to the `password` variable to conform to Microsoft password complexity requirements. 

### Changed
- **Auth:** Switched from SSH key decryption to explicit password variable.
- **User Data:** Script now installs OpenSSL/Chocolatey and auto-imports certificates.
- **Outputs:** Enhanced `Deployment_Status` with connection strings and validation commands.

### Removed
- `var.sbpemkey` (SSH key file dependency).