resource "aws_s3_bucket" "dummy_bucket" {
    bucket = "my-bucket"
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.dummy_bucket.id
  acl = "authenticated-read"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "bucket_encrypt_config" {
  bucket = aws_s3_bucket.dummy_bucket.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_logging" "bucket_logs" {
  bucket        = aws_s3_bucket.dummy_bucket.id
  target_bucket = "logging-bucket"
  target_prefix = "s3-"
}

resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.dummy_bucket.id
  versioning_configuration {
    status = "enabled"
  }
}
