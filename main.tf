data "external" "this" {
  program = ["python", "${path.module}/list_s3_keys.py", "-"]

  query = {
    bucket    = "${var.bucket}"
    prefix    = "${var.prefix}"
    delimiter = "${var.delimiter}"
  }
}
