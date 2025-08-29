resource "aws_network_acl" "nacl_public" {
    vpc_id = aws_vpc.vpc-01.id
    subnet_ids = [aws_subnet.public_subnet.id]
    tags = {
        Name = "${random_pet.sai_pet.id}-Public"
    }
}

resource "aws_network_acl_rule" "nacl_public_inbound_http" {
    network_acl_id = aws_network_acl.nacl_public.id
    rule_number = 100
    egress = false
    protocol = "tcp"
    rule_action = "allow"
    cidr_block = var.all_ipv4_cidr
    from_port = 80
    to_port = 80
}
resource "aws_network_acl_rule" "nacl_public_inbound_https" {
    network_acl_id = aws_network_acl.nacl_public.id
    rule_number = 110
    egress = false
    protocol = "tcp"
    rule_action = "allow"
    cidr_block = var.all_ipv4_cidr
    from_port = 443
    to_port = 443
}
resource "aws_network_acl_rule" "nacl_public_inbound_rdp" {
    network_acl_id = aws_network_acl.nacl_public.id
    rule_number = 120
    egress = false
    protocol = "tcp"
    rule_action = "allow"
    cidr_block = "${local.home_ip}/32"
    from_port = 3389
    to_port = 3389
    
}

resource "aws_network_acl_rule" "nacl_public_inbound_dynamic" {
    network_acl_id = aws_network_acl.nacl_public.id
    rule_number = 130
    egress = false
    protocol = "tcp"
    rule_action = "allow"
    cidr_block = var.all_ipv4_cidr
    from_port = 1024
    to_port = 65535
}
resource "aws_network_acl_rule" "nacl_public_outbound_all" {
    network_acl_id = aws_network_acl.nacl_public.id
    rule_number = 500
    egress = true
    protocol = "-1"
    rule_action = "allow"
    cidr_block = var.all_ipv4_cidr
    from_port = 0
    to_port = 0
}

resource "aws_network_acl" "nacl_private" {
    vpc_id = aws_vpc.vpc-01.id
    subnet_ids = [aws_subnet.private_subnet.id]
    tags = {
        Name = "${random_pet.sai_pet.id}-private"
    }
}
resource "aws_network_acl_rule" "nacl_private_inbound_mysql" {
    network_acl_id = aws_network_acl.nacl_private.id
    rule_number = 100
    egress = false
    protocol = "tcp"
    rule_action = "allow"
    cidr_block = "${aws_instance.windows.private_ip}/32"
    from_port = 3306
    to_port = 3306
}
resource "aws_network_acl_rule" "nacl_private_inbound_ssh" {
    network_acl_id = aws_network_acl.nacl_private.id
    rule_number = 110
    egress = false
    protocol = "tcp"
    rule_action = "allow"
    cidr_block = "${aws_instance.windows.private_ip}/32"
    from_port = 22
    to_port = 22
}

resource "aws_network_acl_rule" "nacl_private_inbound_dynamic" {
    network_acl_id = aws_network_acl.nacl_private.id
    rule_number = 120
    egress = false
    protocol = "tcp"
    rule_action = "allow"
    cidr_block = var.all_ipv4_cidr
    from_port = 1024
    to_port = 65535
}

resource "aws_network_acl_rule" "nacl_private_outbound_all" {
    network_acl_id = aws_network_acl.nacl_private.id
    rule_number = 500
    egress = true
    protocol = "-1"
    rule_action = "allow"
    cidr_block = var.all_ipv4_cidr
    from_port = 0
    to_port = 0
}