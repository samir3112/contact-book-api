#!/bin/bash
apt update -y
apt install docker.io -y
docker pull samir3112/contact-api
docker run -d -p 80:5000 samir3112/contact-api
