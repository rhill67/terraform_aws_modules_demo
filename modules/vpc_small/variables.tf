variable "name_prefix" { type = string }
variable "aws_region" { type = string }

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
}

variable "subnet_cidrs" {
  description = "List of subnet CIDRs (recommend 2+ for RDS)."
  type        = list(string)
}
