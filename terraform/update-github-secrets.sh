#!/bin/bash

cd terraform/

EC2_IP=$(terraform output -raw ec2_public_ip)
RDS_ENDPOINT=$(terraform output -raw rds_endpoint)

gh secret set EC2_HOST -b"$EC2_IP" -R samir3112/contact-book-api
gh secret set RDS_ENDPOINT -b"$RDS_ENDPOINT" -R samir3112/contact-book-api

echo "✅ Updated EC2_HOST: $EC2_IP"
echo "✅ Updated RDS_ENDPOINT: $RDS_ENDPOINT"
