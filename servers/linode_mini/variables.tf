variable "api_token" {
    description = "Linode API Token"
    type = string
}

variable "authorized_key" {
    description = "Linode Server SSH Public Key"
    type = string
}

variable "root_pass" {
    description = "Server SSH Root pass"
    type = string
}
