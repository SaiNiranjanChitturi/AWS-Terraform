output "random_pet_name" {
    value = random_pet.sai_pet.id 
}

output "random_id_base64_std" {
    value = random_id.sai_id.b64_std
}

output "random_id_base64_url" {
    value = random_id.sai_id.b64_url
}

output "random_id_hex" {
    value = random_id.sai_id.hex
}

output "random_id_dec" {
    value = random_id.sai_id.dec
}

output "random_id_bytes" {
    value = random_id.sai_id.byte_length
}

output "random_id_keepers" {
    value = random_id.sai_id.keepers
}

output "random_id_prefix" {
    value = random_id.sai_id.prefix
}

output "random_integer" {
    value = random_integer.sai_integer.result
}

output "random_integer_min" {
    value = random_integer.sai_integer.min
}

output "random_integer_max" {
    value = random_integer.sai_integer.max
}

output "random_integer_result" {
    value = random_integer.sai_integer.result
}

output "random_integer_seed" {
    value = random_integer.sai_integer.seed
}

output "random_integer_keepers" {
    value = random_integer.sai_integer.keepers
}

output "random_string" {
    value = random_string.sai_string.result
}

output "linux_instance_id" {
    value = aws_instance.linux.id
}

output "linux_instance_private_ip" {
    value = aws_instance.linux.private_ip
}

output "windows_instance_id" {
    value = aws_instance.windows.id
}

output "windows_instance_private_ip" {
    value = aws_instance.windows.private_ip
}

output "windows_instance_public_ip" {
    value = aws_instance.windows.public_ip
}

output "NAT_public_IP" {
    value = aws_eip.nat_eip.public_ip
}

output "NAT_private_IP" {
    value = aws_eip.nat_eip.private_ip
}
output "key_pair_name" {
    value = aws_key_pair.sai_key.key_name
}

output "home_ip" {
    value = local.home_ip
}

output "windows_encrypted_pwd" {
    value = aws_instance.windows.password_data
    sensitive = false  
}
resource "local_file" "encrypt_pwd" {
    filename = "encrypted_password.txt"
    content = aws_instance.windows.password_data
    
    provisioner "local-exec" {
    command = "echo ${local_file.encrypt_pwd.content}| base64 -d | openssl rsautl -decrypt -inkey ./${local_file.sai_private_key_pem.filename} -out decrypt_password.txt"
    }
}

output "reachable" { 
    value = aws_ec2_network_insights_analysis.home_to_ec2_analysis.path_found
}

output "status" { 
    value = aws_ec2_network_insights_analysis.home_to_ec2_analysis.status
}

output "network_path_id" { 
    value = aws_ec2_network_insights_path.home_to_ec2.id
}

output "explanation" { 
    value = aws_ec2_network_insights_analysis.home_to_ec2_analysis.explanations
}

output "network_insights_path_info" {
  description = "Details of the Network Insights Path from home to EC2"
  value = {
    path_id        = aws_ec2_network_insights_path.home_to_ec2.id
    source         = aws_ec2_network_insights_path.home_to_ec2.source
    destination    = aws_ec2_network_insights_path.home_to_ec2.destination
    protocol       = aws_ec2_network_insights_path.home_to_ec2.protocol
    destination_port = aws_ec2_network_insights_path.home_to_ec2.destination_port
    tags           = aws_ec2_network_insights_path.home_to_ec2.tags
  }
}
