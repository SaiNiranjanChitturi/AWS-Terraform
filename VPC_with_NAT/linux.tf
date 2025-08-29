resource "aws_instance" "linux" {
    subnet_id = aws_subnet.private_subnet.id
    ami = var.linux_ami
    instance_type = var.instance_type_t3_micro
    vpc_security_group_ids = [aws_security_group.linux_sg.id]
    key_name      = aws_key_pair.sai_key.key_name
    
    ebs_block_device {
        device_name = "/dev/xvda"
        volume_size = 30
        volume_type = "gp3"
        delete_on_termination = true
    }
    tags = {
        Name = "${random_pet.sai_pet.id}-linux"
    }
}