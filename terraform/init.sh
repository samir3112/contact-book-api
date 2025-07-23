#!/bin/bash
yum update -y
yum install -y docker
systemctl start docker
systemctl enable docker
usermod -aG docker ec2-user

# Pull image
docker pull samir3112/contact-api

# Run with ENV variables for DB connection
docker run -d -p 80:5000 \
  -e DB_USER=admin \
  -e DB_PASS=password123 \
  -e DB_HOST=${db_endpoint} \
  -e DB_NAME=contactdb \
  samir3112/contact-api




# terraform init  # terraform plan  # terraform apply -auto-approve  # terraform output
# chmod 400 ~/n-varginia.pem
# ssh -i ~/n-varginia.pem ec2-user@<public-ip>
# docker ps
# curl http://<public-ip> and curl http://<public-ip>/contacts
# http://54.165.213.187  and http://54.165.213.187/contacts (Access via browser)

# sudo yum install -y mariadb105
#  mysql -h <rds_endpoint> -u admin -p
# SHOW DATABASES
# USE contactdb;
# SHOW TABLES;

# # curl -X POST http://localhost:5000/contacts -H "Content-Type: application/json" -d '{"name": "Samir", "email": "samir@example.com", "phone": "1234567890"}'