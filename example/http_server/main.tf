provider "aws" {
	region = "ap-northeast-1"
}

variable "example_instance_type" {}

resource "aws_security_group" "example_ec2" {
	name = "example-ec2"

	ingress {
		from_port = 80
		to_port = 80
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}

	egress {
		from_port = 0
		to_port = 0
		protocol = "-1"
		cidr_blocks = [ "0.0.0.0/0" ]
	}
}

resource "aws_instance" "example" {
	ami = "ami-0c3fd0f5d33134a76"
	instance_type = var.example_instance_type
	vpc_security_group_ids = [aws_security_group.example_ec2.id]
	tags = {
		Name = "example"
	}

	user_data = file("./user_data.sh")
}

output "id" {
    value = aws_instance.example.id
}

output "public_dns" {
    value = aws_instance.example.public_dns
}
