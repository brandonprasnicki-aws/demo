/*
resource "aws_iam_role" "ssm_ec2_role" {
  #count = var.create_ssm_roles ? 1 : 0
  name    = "${var.tag_prefix}-${local.common_tags["Environment"]}-ec2-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": ["ec2.amazonaws.com"]
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}


resource "aws_iam_instance_profile" "ssm_profile" {
  name    = "${var.tag_prefix}-${local.common_tags["Environment"]}-ec2-role"
  role = aws_iam_role.ssm_ec2_role.name
}

locals{
  ssm_role_attachment = ["arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore",
                            "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"]
}

resource "aws_iam_role_policy_attachment" "ssm-instance-profile" {
  count      = length(local.ssm_role_attachment)

  role       = aws_iam_role.ssm_ec2_role.name
  policy_arn = local.ssm_role_attachment[count.index]
}
*/