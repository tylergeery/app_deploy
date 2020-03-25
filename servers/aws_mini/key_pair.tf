variable "keyfile" {
  type = string
  description = "Default AWS region"
}

resource "aws_key_pair" "aws-mini-key-pair" {
  key_name   = "aws-mini"
  public_key = file(var.keyfile)
}
