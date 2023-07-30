provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "example" {
    name = "qa1"
    ami = "ami-0b38992422f1e137f"
    instance_type = "m4.large"
    tags = {
        name = "qa1_server"
    }
}

resource "aws_security_group" "sg-1" {
    name = "sg-1"
    description = "ports 80, 22 and 443 will be open to all traffic"
    ingress {
        cidr_blocks = ["0.0.0.0/0"]
        from_port = 80
        to_port = 80
        protocol = "tcp"
    }
    
    ingress {
        cidr_block = ["0.0.0.0/0"]
        from_port = 22
        to_port = 22
        protocol = "tcp"
    }

    ingress {
        cidr_block = ["0.0.0.0/0"]
        from_port = 443
        to_port = 443
        protocol = "tcp"
    }
}