resource "aws_s3_bucket" "sampleBucket" {
    bucket = "my-bucket"

    acl = "authenticated-read"

    server_side_encryption_configuration {
      rule {
        apply_server_side_encryption_by_default {
            sse_algorithm = "AES256"
        }
      }
    }

    logging {
      target_bucket = "logging-bucket"
    }

    versioning {
      enabled = true
    }
}