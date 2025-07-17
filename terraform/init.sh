#!/bin/bash
yum update -y
yum install -y docker
systemctl start docker
systemctl enable docker
usermod -aG docker ec2-user
docker pull samir3112/contact-api
docker run -d -p 80:5000 samir3112/contact-api

# terraform init  # terraform plan  # terraform apply -auto-approve  # terraform output
# chmod 400 ~/n-varginia.pem
# ssh -i ~/n-varginia.pem ec2-user@<public-ip>
# docker ps
# curl http://<public-ip> and curl http://<public-ip>/contacts