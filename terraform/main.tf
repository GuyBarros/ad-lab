resource "vault_password_policy" "ldapstandard" {
  name = "ldapstandard"

  policy = file("${path.module}/files/password_policy.hcl")
}
resource "vault_ldap_secret_backend" "config" {
  path            = "ldap"
  binddn          = "CN=Administrator,CN=Users,DC=hashidemos,DC=io"
  bindpass        = "Welcome1"
  url             = "ldaps://ec2-35-177-171-252.eu-west-2.compute.amazonaws.com"
  insecure_tls    = "true"
  starttls        = false
  schema          = "ad"
  password_policy = vault_password_policy.ldapstandard.name
}

resource "vault_ldap_secret_backend_dynamic_role" "role" {
  mount             = vault_ldap_secret_backend.config.path
  role_name         = "dynamic-role"
  creation_ldif     = file("${path.module}/files/creation.ldif")
  deletion_ldif     = file("${path.module}/files/deletion.ldif")
  username_template = "v_{{random 15}}"
  default_ttl       = 1440 # 4 hours
}

