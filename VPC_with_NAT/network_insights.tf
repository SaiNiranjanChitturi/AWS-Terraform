# If you already have an IGW resource, use that ID instead of the data source below.
data "aws_internet_gateway" "vpc_igw" {
    filter {
    name   = "attachment.vpc-id"
    values = [aws_vpc.vpc-01.id]  # <-- replace with your VPC resource
    }
}

resource "aws_ec2_network_insights_path" "home_to_ec2" {
    # BOTH sides are provided:
    source           = data.aws_internet_gateway.vpc_igw.id     # source resource (IGW)
    destination      = aws_instance.windows.id          # destination resource (your EC2)
    protocol         = "tcp"
    destination_port = 80

    # Narrow the source to ONLY your home public IP
    

    tags = {
    Name = "home_to_ec2-${random_pet.sai_pet.id}"
    } 
}

resource "aws_ec2_network_insights_analysis" "home_to_ec2_analysis" {
    network_insights_path_id = aws_ec2_network_insights_path.home_to_ec2.id
    wait_for_completion      = true
}
