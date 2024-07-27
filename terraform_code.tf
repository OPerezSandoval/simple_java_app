provider "aws" {
    region = "us-east-1"
}

# Create EC2 Instance
# Add the security group
# Add the subnet id
resource "aws_instance" "deveop_project_server" {
    ami = "ami-04a81a99f5ec58529"
    instance_type = "t2.micro"
    key_name = "newKeyPair"

    security_groups = [
        aws_security_group.demo_sg.name
    ]
}

# Create Security Group
# Specify the ingress and egress values
# Add the vpc id 
resource "aws_security_group" "demo_sg" {
    name = "demo_sg"
    description = "SG for SSH access"

    ingress {
        description = "SSH"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    ingress {
        description = "Jenkins Port"
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
        Name = "ssh_prot"
    }
}