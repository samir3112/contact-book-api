resource "aws_security_group" "allow_http" {
  name        = "allow_http"
  description = "Allow HTTP inbound traffic"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "contact_api" {
  ami                    = var.ami_id  # ✅ Your selected AMI
  instance_type          = "t2.micro"
  user_data              = file("${path.module}/../init.sh")
  vpc_security_group_ids = [aws_security_group.allow_http.id]

  tags = {
    Name = "ContactBookApp"
  }
}

