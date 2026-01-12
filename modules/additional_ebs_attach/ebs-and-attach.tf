resource "aws_ebs_volume" "additional_ebs" {
  availability_zone = var.availability_zone
  size              = var.additional_volume_size
  type              = "gp3"
  encrypted         = "true"
  tags = merge(
    local.common_tags,
    {
      Name = "${var.tag_prefix}-${var.aws_instance_id}-${local.common_tags["Environment"]}-ec2-${var.availability_zone}"
      Description = "additional ebs volume for ${var.aws_instance_id} instance"
    },
  )
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = var.device_name
  volume_id   = aws_ebs_volume.additional_ebs.id
  instance_id = var.aws_instance_id
}