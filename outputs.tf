output "keys" {
  description = "List of S3 object keys returned from the S3 bucket"
  value       = ["${split(var.delimiter, data.external.this.result["keys"])}"]
}
