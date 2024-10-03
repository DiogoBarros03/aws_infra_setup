output "private_key_pem" {
  value     = tls_private_key.my_key_pair.private_key_pem
  sensitive = true
}
