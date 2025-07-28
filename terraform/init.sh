#!/bin/bash
yum update -y
yum install -y docker
systemctl start docker
systemctl enable docker
usermod -aG docker ec2-user

# Wait to ensure RDS is ready
sleep 60

# Pull and run your image
docker pull samir3112/contact-api

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
# sudo usermod -aG docker ec2-user (if daemon permission then run this)
# curl http://<public-ip> and curl http://<public-ip>/contacts
# http://54.165.213.187  and http://54.227.202.108/contacts (Access via browser)

# sudo yum install -y mariadb105  OR   1) sudo apt update  2) sudo apt install mysql-client -y
#  mysql -h <rds_endpoint> -u admin -p
# SHOW DATABASES
# USE contactdb;
# SHOW TABLES;
# SELECT * FROM contact;

#  curl -X POST http://localhost/contacts -H "Content-Type: application/json" -d '{"name": "Samir", "email": "samir@example.com", "phone": "1234567890"}'
#  curl -X PUT http://localhost/contacts/1 -H "Content-Type: application/json" -d '{"name": "Samir", "email": "samirparate@gmail.com", "phone": "8999419811"}'

# NEW METHOD
# terraform apply -auto-approve
# chmod +x update-github-secrets.sh ( For first time )
# ./update-github-secrets.sh
# git add .      git commit -m "My changes for Day 4/5"    git push origin main

