resource "random_password" "password" {
  length           = 30
  special          = false
  override_special = "_%@"
}
