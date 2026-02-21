variable "name_prefix" { type = string }
variable "vpc_id" { type = string }
variable "subnet_id" { type = string }
variable "instance_type" { type = string }

variable "key_name" {
  description = "Optional key pair name. If empty, no key will be set."
  type        = string
  default     = ""
}
