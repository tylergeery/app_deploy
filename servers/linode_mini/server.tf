provider "linode" {
    token = var.api_token
}

resource "linode_instance" "linode-mini" {
    label = "linode-mini"
    image = "linode/ubuntu18.04"
    region = "us-west"
    type = "g6-nanode-1"
    authorized_keys = [var.authorized_key]
}
