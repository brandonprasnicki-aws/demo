resource "aws_s3_bucket" "rds_bucket" {
  bucket = var.rds_bucket
}


resource "aws_s3_bucket_ownership_controls" "cloudfront_bucket_control" {
  bucket = aws_s3_bucket.rds_bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
resource "aws_s3_bucket_public_access_block" "s3-bucket_block_public" {
  bucket                  = aws_s3_bucket.rds_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
/*
resource "aws_s3_bucket_acl" "rds_bucket_acl" {
  bucket = aws_s3_bucket.rds_bucket.id
  acl    = "private"
}

 */