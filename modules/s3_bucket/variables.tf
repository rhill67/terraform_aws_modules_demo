variable "name_prefix" { type = string }

variable "bucket_name" {
  description = "Optional explicit bucket name. If empty, module generates a unique name."
  type        = string
  default     = ""
}

variable "force_destroy" {
  description = "If true, bucket can be destroyed even if it contains objects (demo-friendly)."
  type        = bool
  default     = true
}
