resource "aws_s3_bucket" "bucket" {
  bucket = "new-bucket-998877665566556655"
}

resource "aws_s3_bucket_public_access_block" "bucket" {
  bucket = aws_s3_bucket.bucket.id
  block_public_acls = false
  block_public_policy = false
  ignore_public_acls = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_ownership_controls" "owner" {
  bucket = aws_s3_bucket.bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "bucket" {
  depends_on = [aws_s3_bucket_ownership_controls.owner]
  bucket = aws_s3_bucket.bucket.id
  acl = "public-read"
}

resource "aws_s3_bucket_policy" "allow_access_from_other_accounts" {
  bucket = aws_s3_bucket.bucket.id
  policy = data.aws_iam_policy_document.allow_access_from_other_accounts.json
}

data "aws_iam_policy_document" "allow_access_from_other_accounts" {
  statement {
    principals {
      type = "AWS"
      identifiers = ["494404042841"]
    }
    actions = [
        "s3:GetObject",
        "s3:ListBucket"
    ]
    resources = [
        aws_s3_bucket.bucket.arn,
        "${aws_s3_bucket.bucket.arn}/*"
    ]
  }
}