resource "aws_instance" "windows" {
    ami = var.windows_ami
    instance_type = var.instance_type_t3_micro
    get_password_data = true
    subnet_id = aws_subnet.public_subnet.id
    ebs_block_device {
        device_name = "/dev/sda1"
        volume_size = 30
        volume_type = "gp3"
        delete_on_termination = true
    }
    vpc_security_group_ids = [aws_security_group.windows_sg.id]
    key_name = aws_key_pair.sai_key.id
    
    tags = {
        Name = "${random_pet.sai_pet.id}-windows"
    }
}

resource "aws_eip_association" "windows_eip_assoc" {
    instance_id = aws_instance.windows.id
    allocation_id = aws_eip.windows_eip.id
}