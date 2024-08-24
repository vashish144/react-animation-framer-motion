provider "aws" {
  region = "us-east-1"  # Change to your desired region
}

resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0"  # Ubuntu AMI ID (Change to your region's Ubuntu AMI ID)
  instance_type = "t2.micro"

  tags = {
    Name = "WebServer"
  }

  key_name = "your-key-name"  # Replace with your key pair name

  user_data = <<-EOF
              #!/bin/bash
              apt-get update
              apt-get install -y apache2
              systemctl start apache2
              systemctl enable apache2
              EOF
}

output "instance_ip" {
  value = aws_instance.web.public_ip
}
