resource "aws_vpc" "vpc-01" {
    cidr_block = var.vpc_cidr
    enable_dns_support = true
    enable_dns_hostnames = true
    tags = {
        Name = random_pet.sai_pet.id
    }
}

resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.vpc-01.id
    availability_zone = var.public_availability_zone
    cidr_block = var.public_cidr
    tags = {
        Name = "public-${random_pet.sai_pet.id}"
    }
}

resource "aws_route_table_association" "public_rt_assoc" {
    route_table_id = aws_route_table.public_rt.id
    subnet_id = aws_subnet.public_subnet.id
    
}

resource "aws_subnet" "private_subnet" {
    vpc_id = aws_vpc.vpc-01.id
    availability_zone = var.private_availability_zone
    cidr_block = var.private_cidr
    tags = {
        Name = "private-${random_pet.sai_pet.id}"
    }

}
