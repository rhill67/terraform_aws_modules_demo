module "vpc" {
  source      = "./modules/vpc_small"
  name_prefix = var.name_prefix
  vpc_cidr    = "10.0.100.0/28"
  subnet_cidr = "10.0.100.0/28"
  aws_region  = var.aws_region
}

module "ec2" {
  source        = "./modules/ec2_two"
  name_prefix   = var.name_prefix
  subnet_id     = module.vpc.subnet_id
  vpc_id        = module.vpc.vpc_id
  instance_type = var.instance_type
  key_name      = var.ec2_key_name
}

module "rds" {
  source            = "./modules/rds_small"
  name_prefix       = var.name_prefix
  vpc_id            = module.vpc.vpc_id
  subnet_ids        = [module.vpc.subnet_id]
  db_engine         = var.db_engine
  db_engine_version = var.db_engine_version
  instance_class    = var.db_instance_class
  db_name           = var.db_name
  username          = var.db_username
  password          = var.db_password
}

module "s3" {
  source      = "./modules/s3_bucket"
  name_prefix = var.name_prefix
  bucket_name = var.s3_bucket_name
  force_destroy = true
}

module "glue" {
  source        = "./modules/glue_database"
  name_prefix   = var.name_prefix
  database_name = var.glue_database_name
}
