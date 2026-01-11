
resource "aws_flow_log" "flow_log" {
  iam_role_arn    = aws_iam_role.vpc-service-role.arn
  log_destination = aws_cloudwatch_log_group.vpcloggroup.arn
  traffic_type    = "ALL"
  vpc_id          = aws_vpc.main.id
}

resource "aws_cloudwatch_log_group" "vpcloggroup" {
  name = "cwlogs-${aws_vpc.main.tags["Name"]}"
  retention_in_days = var.flow_log_cloudwatch_log_group_retention_in_days
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["vpc-flow-logs.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "vpc-service-role" {
  name               = "${var.tag_prefix}-vpc-service-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "aws_iam_policy_document" "example" {
  statement {
    effect = "Allow"

    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:DescribeLogGroups",
      "logs:DescribeLogStreams",
    ]

    resources = ["*"]
  }
}

resource "aws_iam_role_policy" "vpc-service-policy" {
  name   = "${var.tag_prefix}-vpc-service-policy"
  role   = aws_iam_role.vpc-service-role.id
  policy = data.aws_iam_policy_document.example.json
}
