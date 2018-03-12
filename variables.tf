variable "bucket" {
  type        = "string"
  description = "Name of the S3 bucket from which keys will be retrieved"
}

variable "prefix" {
  type        = "string"
  description = "S3 key prefix in which to look for object keys"
  default     = ""
}

variable "delimiter" {
  type        = "string"
  description = "Delimiter used to separate returned object keys"
  default     = ","
}
