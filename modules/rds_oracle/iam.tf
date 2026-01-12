resource "aws_iam_policy" "IAMManagedPolicy" {
    name = "${var.project}-s3-integration-policy"
    path = "/"
    policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "s3:PutObject",
                "s3:GetObject",
                "s3:ListBucket"
            ],
            "Resource": [
                "arn:aws:s3:::*/*",
                "arn:aws:s3:::${aws_s3_bucket.rds_bucket.bucket_domain_name}",
                "arn:aws:s3:::${aws_s3_bucket.rds_bucket.bucket_domain_name}/*"
            ]
        }
    ]
}
EOF
}

resource "aws_iam_role" "IAMRole" {
    path = "/"
    name = "rds-s3-integration-role"
    assume_role_policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Sid\":\"\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"rds.amazonaws.com\"},\"Action\":\"sts:AssumeRole\"}]}"
    max_session_duration = 3600
    tags = {

    }
}