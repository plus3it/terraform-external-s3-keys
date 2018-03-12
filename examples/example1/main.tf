resource "aws_s3_bucket" "example" {
  bucket_prefix = "terraform-aws-bucket-keys-"
}

resource "aws_s3_bucket_object" "foo" {
  bucket  = "${aws_s3_bucket.example.id}"
  key     = "foo/path/to/foo"
  content = "it is all foo"
}

resource "aws_s3_bucket_object" "bar" {
  bucket  = "${aws_s3_bucket.example.id}"
  key     = "bar/none"
  content = "nothing to see here"
}

module "all" {
  source = "../../"
  bucket = "${aws_s3_bucket.example.id}"
}

module "foo" {
  source = "../../"
  bucket = "${aws_s3_bucket.example.id}"
  prefix = "foo/"
}

module "bar" {
  source = "../../"
  bucket = "${aws_s3_bucket.example.id}"
  prefix = "bar/"
}


output "bucket_name" {
  description = "Name of the S3 Bucket"
  value       = "${aws_s3_bucket.example.id}"
}

output "foo" {
  description = "Path to the foo key"
  value       = "${aws_s3_bucket_object.foo.id}"
}

output "bar" {
  description = "Path to the bar key"
  value       = "${aws_s3_bucket_object.foo.id}"
}

output "all_keys" {
  description = "List of all keys in the bucket"
  value       = "${module.all.keys}"
}

output "foo_keys" {
  description = "List of foo keys in the buckets"
  value       = "${module.foo.keys}"
}

output "bar_keys" {
  description = "List of bar keys in the buckets"
  value       = "${module.bar.keys}"
}
