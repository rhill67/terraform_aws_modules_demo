# Terraform AWS Modules Demo (VPC + 2x EC2 + Small RDS + Glue Database + s3 Bucket)

This repo contains 5 Terraform modules:
- `modules/vpc_small` : creates a VPC and a subnet with CIDR `10.0.100.0/28`
- `modules/ec2_two`   : creates **two** EC2 instances in a provided subnet
- `modules/rds_small` : creates a small RDS instance in provided subnets
- `modules/glue_database` : creates a Glue database catglogue instance in provided subnets
- `modules/s3_bucket` : creates an s3_bucket 

## Quick deploy (AWS or AWS GovCloud)
1) Install Terraform (>= 1.5) and AWS CLI.
2) Authenticate to your AWS account (or assume role) in the target partition/region.
3) Copy `terraform.tfvars.example` to `terraform.tfvars` and edit values (especially DB password).
4) Run:
```bash
terraform init
terraform validate
terraform plan
terraform apply
terraform destroy
```

## Notes
- The VPC CIDR is intentionally small (`10.0.100.0/28`). Fine for a demo, tight for real workloads.
- For GovCloud, set `aws_region` to `us-gov-west-1` or `us-gov-east-1` and ensure your credentials are for GovCloud.
- RDS master password is stored in Terraform state (normal Terraform behavior). Use remote encrypted state in real environments.
- Glue database is expensive, so remove after demo 
- If S3 bucket variable 'force_destroy' is set to true so a 'terraform destroy' will remove it and all files and sub-directories within 
