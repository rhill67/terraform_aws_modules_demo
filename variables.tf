variable "aws_region" {
  description = "AWS region (use GovCloud regions like us-gov-west-1 if needed)."
  type        = string
  default     = "us-east-1"
}

variable "name_prefix" {
  description = "Prefix used for naming resources."
  type        = string
  default     = "tf-demo"
}

# EC2
variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "ec2_key_name" {
  description = "Optional EC2 key pair name for SSH. Leave empty to create instances without a key."
  type        = string
  default     = ""
}

# RDS
variable "db_engine" {
  type    = string
  default = "postgres"
}

variable "db_engine_version" {
  type    = string
  default = "18.2"
}

variable "db_instance_class" {
  type    = string
  default = "db.t3.micro"
}

variable "db_name" {
  type    = string
  default = "appdb"
}

variable "db_username" {
  type    = string
  default = "admindemo"
}

variable "db_password" {
  description = "RDS master password (12+ chars recommended)."
  type        = string
  sensitive   = true
}

# S3
variable "s3_bucket_name" {
  description = "Optional bucket name. Leave empty to auto-generate a unique name."
  type        = string
  default     = ""
}

# Glue
variable "glue_database_name" {
  description = "Glue database name."
  type        = string
  default     = "dvdrental_db"
}
