data "http" "my_ip" {
    url = "https://checkip.amazonaws.com"
}

locals {
    home_ip = trimspace(data.http.my_ip.response_body)
}