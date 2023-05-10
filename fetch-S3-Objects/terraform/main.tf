terraform {
 required_providers {
   aws = {
     source = "hashicorp/aws"
   }
 }
}
    
provider "aws" {
  region = "us-east-1"
  profile = "default"
}

/// WARNING - creates a PUBLIC bucket - use only for testing
/// UPLOAD YOUR OWN FILES FOR TESTING

resource "aws_s3_bucket" "public_bucket" {
  bucket_prefix = "public-test-bucket-"
  force_destroy = true
}

resource "aws_s3_bucket_ownership_controls" "bucket-owner" {
  bucket = aws_s3_bucket.public_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}


resource "aws_s3_bucket_public_access_block" "public-access" {
  bucket = aws_s3_bucket.public_bucket.id
  block_public_acls = false
  block_public_policy = false
  ignore_public_acls = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "public-acl-example" {
  depends_on = [
    aws_s3_bucket_ownership_controls.bucket-owner,
    aws_s3_bucket_public_access_block.public-access,
  ]

  bucket = aws_s3_bucket.public_bucket.id
  acl = "public-read"
}