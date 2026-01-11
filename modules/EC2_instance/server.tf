resource "aws_instance" "this" {
  ami = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = var.security_groups
  #subnet_id   = var.app_subnets_ids[count.index % length(var.app_subnets_ids)]
  subnet_id   = var.target_subnets_id
  associate_public_ip_address = var.associate_public_ip_address
  private_ip = var.private_ip
  iam_instance_profile = var.aws_iam_instance_profile_id
  key_name = var.key_name
  #user_data = var.user_data



#  user_data = "${data.template_file.myuserdata.rendered}"



  tags = merge(
  local.common_tags,
  {
    Name = "${var.instance_name}"
    Description = "host for ${var.instance_name} instance"
#    "${var.patch_scan_tag_name}" = var.patch_scan_tag_value
#    "${var.patch_tag_name}" = var.patch_tag_value
  },
  )

  root_block_device {
    volume_type = "gp3"
    volume_size = var.volume_size
    delete_on_termination = true
    encrypted = true
    tags = local.common_tags
  }
  lifecycle {
    ignore_changes = [ami, user_data]
  }
  metadata_options {
    http_tokens = var.http_tokens
  }
}

