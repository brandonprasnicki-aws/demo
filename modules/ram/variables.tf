variable "target_account" {}
variable "tgw_arn" {}
variable "common_tags" {
  type = map(string)

}
variable "share_name" {
  default = "TGW share"
}
variable "allow_external_principals" {
  default = false
}