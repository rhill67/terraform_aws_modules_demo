resource "random_id" "suffix" {
  byte_length = 4
}

locals {
  final_bucket_name = var.bucket_name != "" ? var.bucket_name : "${var.name_prefix}-bucket-${random_id.suffix.hex}"
}

resource "aws_s3_bucket" "this" {
  bucket        = local.final_bucket_name
  force_destroy = var.force_destroy

  tags = {
    Name      = local.final_bucket_name
    ManagedBy = "Terraform"
    Module    = "s3_bucket"
  }
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.this.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
