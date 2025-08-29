resource "aws_security_group" "windows_sg" {
    name = "windows-sg-${random_pet.sai_pet.id}"
    description = "Allows RDP, HTTP and HTTPS traffic"
    vpc_id = aws_vpc.vpc-01.id

    ingress {
        from_port = 3389
        to_port = 3389
        protocol = "tcp"
        cidr_blocks = ["${local.home_ip}/32"]
        description = "Allows inbound RDP 3389"
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = [var.all_ipv4_cidr]
        description = "Allow inbound HTTP 80"
    }

    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = [var.all_ipv4_cidr]
        description = "Allow inbound HTTPS 443"
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = [var.all_ipv4_cidr]
        description = "Allow all outbound traffic"
    }

    tags = {
        Name = random_pet.sai_pet.id
    }
}

resource "aws_security_group" "linux_sg" {
    name = "linux-sg-${random_pet.sai_pet.id}"
    description = "Allows SSH, and MySQL traffic"
    vpc_id = aws_vpc.vpc-01.id

    ingress {
        description = "Allows inbound SSH 22"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["${aws_instance.windows.private_ip}/32"]
    }

    ingress {
        description = "Allows inbound MySQL 3306"
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        cidr_blocks = ["${local.home_ip}/32"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = [var.all_ipv4_cidr]
        description = "Allows all outbound traffic"
    }
}