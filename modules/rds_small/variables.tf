variable "name_prefix" { type = string }
variable "vpc_id" { type = string }
variable "subnet_ids" { type = list(string) }

variable "db_engine" { type = string }
variable "db_engine_version" { type = string }
variable "instance_class" { type = string }
variable "db_name" { type = string }

#variable "username" { type = string, sensitive = true }
#variable "password" { type = string, sensitive = true }

variable "username" {
  type      = string
  sensitive = true
}

variable "password" {
  type      = string
  sensitive = true
}
