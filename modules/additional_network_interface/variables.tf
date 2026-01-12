variable "subnet_id" {}
variable "private_ip" {}
variable "security_group_ids" {
  type        = list(string)
  default     = []
}
variable "instance_id" {}