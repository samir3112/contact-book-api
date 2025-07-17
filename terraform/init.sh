#!/bin/bash
yum update -y
amazon-linux-extras install docker -y
service docker start
usermod -a -G docker ec2-user
docker pull samir3112/contact-api
docker run -d -p 80:5000 samir3112/contact-api
