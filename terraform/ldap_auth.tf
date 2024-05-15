resource "vault_ldap_auth_backend" "ldap" {
  path              = "ldap"
  url               = "ldaps://ec2-35-177-171-252.eu-west-2.compute.amazonaws.com"
  userdn            = "OU=Hashicorp Solution Architects,OU=People,DC=hashidemos,DC=io"
  userattr          = "sAMAccountName"
  upndomain         = "hashidemos.io"
  discoverdn        = true
  groupdn           = "OU=Groups,DC=hashidemos,DC=io"
  groupfilter       = "(&(objectClass=group)(member:1.2.840.113556.1.4.1941:={{.UserDN}}))"
  insecure_tls      = true
  starttls          = false
  username_as_alias = true
  binddn            = "CN=Administrator,CN=Users,DC=hashidemos,DC=io"
  bindpass          = "Welcome1"
}