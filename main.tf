provider "aws" {
   region = "eu-west-2"
}
resource "aws_instance" "example" {
    ami = "ami-005383956f2e5fb96"
    instance_type =  "t2.micro"
    tags = {
        Name = "Tarraform Up"
    }
}