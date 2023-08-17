variable "instance_type" {
    description = "the type of ec2 instance"
    type = string 
}

variable "instance_count" {
    description = "the number of instance "
}

resource "aws_instance" "testing" {
    instance_type = var.instance_type
    count = var.instance_count
    ami = "ami-0c55b159cbfafe1f0"
}

output "instance_ids" {
    value = aws_instance.testing.*.id
}

