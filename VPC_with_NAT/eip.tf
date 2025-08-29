resource "aws_eip" "nat_eip" {
    domain = "vpc"
    tags = {
        Name = "${random_pet.sai_pet.id}-NAT"
    }
}

resource "aws_eip" "windows_eip" {
    domain = "vpc"
    tags = {
        Name = "${random_pet.sai_pet.id}-Windows"
    }
}