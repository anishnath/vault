listener "tcp" {
  address = "0.0.0.0:8200"
  tls_disable = false
  tls_cert_file = "vault.crt"
  tls_key_file  = "vault.key"
  tls_client_ca_file = "rootCA.pem"
  tls_require_and_verify_client_cert = false
}
storage "file" {
  path = "/Users/anish.nath@avalara.com/avalara/vault-poc/x509-Auth/"
}
