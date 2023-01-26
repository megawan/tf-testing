data "aws_iam_policy_document" "bucket_policy" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::995105043624:root"]
    }

    actions = [
      "s3:*",
    ]

    resources = [
      "arn:aws:s3:::gika-tf-state/*",
    ]
  }
}

module "s3" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket        = var.name
  acl           = "private"
  force_destroy = true

  attach_policy = true
  policy        = data.aws_iam_policy_document.bucket_policy.json

  # S3 bucket-level Public Access Block configuration
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false

  versioning = {
    enabled = true
  }
  
  tags = {
    Terraform = true
    Author    = "Gika"
  }
}