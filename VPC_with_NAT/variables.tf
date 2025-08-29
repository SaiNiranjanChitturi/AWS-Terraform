variable "vpc_cidr" {
    type = string
    default = "172.16.0.0/20"

}

variable "public_cidr" {
    type = string
    default = "172.16.0.0/21"
    }

variable "private_cidr" {
    type = string 
    default = "172.16.8.0/21"
}

variable "all_ipv4_cidr" {
    type = string
    default = "0.0.0.0/0"
}

variable "public_availability_zone" {
    type = string
    default = "us-east-2a"
}

variable "private_availability_zone" {
    type = string
    default = "us-east-2b"
}

variable "windows_ami" {
    type = string
    default = "ami-05b00365623a86bd3"
}

variable "instance_type_t3_micro" {
    type = string
    default = "t3.micro"
}

variable "linux_ami" {
    type = string
    default = "ami-0bb7d855677353076"
}

variable "my_ip" {
    type = string
    default = "35.149.205.152/32"
}