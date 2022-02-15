variable "vpc_cidr_block" {}
variable "vpc_name" {}
variable "region" {}
variable "ENV" {}
# サブネットのIPアドレスを設定
variable "subnet_public_a" {
  default = "10.0.10.0/24"
}
variable "subnet_public_c" {
  default = "10.0.11.0/24"
}
variable "subnet_public_d" {
  default = "10.0.12.0/24"
}
variable "subnet_private_a" {
  default = "10.0.20.0/24"
}
variable "subnet_private_c" {
  default = "10.0.21.0/24"
}
variable "subnet_private_d" {
  default = "10.0.23.0/24"
}