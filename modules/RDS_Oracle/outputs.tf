output "aws_s3_db_bucket_arn" {
    value = aws_s3_bucket.rds_bucket.arn
}
output "aws_s3_db_bucket_name" {
    value = aws_s3_bucket.rds_bucket.bucket_domain_name
}
