output "instance_ids" { value = [for i in aws_instance.this : i.id] }
output "public_ips"   { value = [for i in aws_instance.this : i.public_ip] }
output "security_group_id" { value = aws_security_group.ec2.id }
