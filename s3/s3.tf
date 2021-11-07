locals {
  common_tags = {
    Team        = "DevOps"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket" "my_bucket" {
  bucket_prefix = "aws-s3-devops-task-"
  acl           = "private"

  versioning {
    enabled = true
  }
  tags = local.common_tags
}
