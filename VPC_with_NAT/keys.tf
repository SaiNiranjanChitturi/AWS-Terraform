resource "tls_private_key" "sai_private_key" {
    algorithm = "RSA"
    rsa_bits = 4096  
}

resource "aws_key_pair" "sai_key" {
    key_name = "${random_pet.sai_pet.id}-windows"
    public_key = tls_private_key.sai_private_key.public_key_openssh  
}

resource "local_file" "sai_private_key_pem" {
    filename = "${random_pet.sai_pet.id}_private.pem"
    content = tls_private_key.sai_private_key.private_key_pem
}

resource "local_file" "sai_public_key_pem" {
    filename = "${random_pet.sai_pet.id}_public.pub"
    content = tls_private_key.sai_private_key.public_key_pem
}