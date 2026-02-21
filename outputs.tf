output "vpc_id" { value = module.vpc.vpc_id }
output "subnet_ids" {
  value = module.vpc.subnet_ids
}

output "ec2_instance_ids" { value = module.ec2.instance_ids }
output "ec2_public_ips" { value = module.ec2.public_ips }

output "rds_endpoint" { value = module.rds.endpoint }

output "s3_bucket_name" {
  value = module.s3.bucket_name
}

output "glue_database_name" {
  value = module.glue.name
}
