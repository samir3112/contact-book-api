output "ec2_public_ip" {
  description = "Public IP of EC2 to access API"
  value       = aws_instance.contact_ec2.public_ip
}

output "rds_endpoint" {
  description = "MySQL RDS Endpoint"
  value       = aws_db_instance.contacts_db.address
}
