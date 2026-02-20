variable "name_prefix" { type = string }
variable "aws_region"  { type = string }

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
}

variable "subnet_cidr" {
  description = "CIDR block for the subnet (must be within vpc_cidr)."
  type        = string
}
