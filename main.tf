provider "aws" {
   region = "eu-west-2"
}
resource "aws_instance" "example" {
    ami = "ami-005383956f2e5fb96"
    instance_type =  "t2.micro"

    user_data = <<-EOF
                        #! /bin/bash
                        echo "Hello, World!" > index.html
                        nohup busybox httpd -f -p 8080 &
                        EOF
}
resource "aws_security_group" "instance" {
    name = "terraform-example-instance"
    ingress {
        from_port = "8080"
        to_port = "8080"
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "Tarraform Up"
    }
}