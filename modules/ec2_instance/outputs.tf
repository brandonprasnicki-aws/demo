
output "InstanceID" {
  value = aws_instance.this.id
}
output "InstanceName" {
  value = var.instance_name
}
output "instance_type" {
  value = var.instance_type
}
output "ami" {
  value = var.ami
}

#output "aws_iam_instance_profile_id" {
#  value = aws_iam_instance_profile.ssm_profile.id
#}
