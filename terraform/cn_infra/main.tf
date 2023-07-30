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
