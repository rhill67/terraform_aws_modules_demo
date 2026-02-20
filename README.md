# Terraform AWS Modules Demo (VPC + 2x EC2 + Small RDS)

This repo contains 3 Terraform modules:
- `modules/vpc_small` : creates a VPC and a subnet with CIDR `10.0.100.0/28`
- `modules/ec2_two`   : creates **two** EC2 instances in a provided subnet
- `modules/rds_small` : creates a small RDS instance in provided subnets

## Quick deploy (AWS or AWS GovCloud)
1) Install Terraform (>= 1.5) and AWS CLI.
2) Authenticate to your AWS account (or assume role) in the target partition/region.
3) Copy `terraform.tfvars.example` to `terraform.tfvars` and edit values (especially DB password).
4) Run:
```bash
terraform init
terraform plan
terraform apply
```

## Notes
- The VPC CIDR is intentionally small (`10.0.100.0/28`). Fine for a demo, tight for real workloads.
- For GovCloud, set `aws_region` to `us-gov-west-1` or `us-gov-east-1` and ensure your credentials are for GovCloud.
- RDS master password is stored in Terraform state (normal Terraform behavior). Use remote encrypted state in real environments.
