resource "random_pet" "sai_pet" {
    length    = 3
}

resource "random_password" "sai_password" {
    length  = 15
    special = true
}

resource "random_id" "sai_id" {
    byte_length = 8
}

resource "random_integer" "sai_integer" {
    min = 10
    max = 100
}

resource "random_string" "sai_string" {
    length  = 12
    upper = true
    special = true
}

resource "random_uuid" "sai_uuid" {

}

resource "random_shuffle" "random_region" {
    input        = ["us-east-1", "us-east-2"]
    result_count = 1
}
