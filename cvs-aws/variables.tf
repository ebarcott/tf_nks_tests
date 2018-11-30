variable "cvs_api_key" {}
variable "cvs_secret_key" {}

variable "aws_keyset_name" {
  default = ""
}

variable "aws_access_key" {
  default = ""
}

variable "aws_secret_key" {
  default = ""
}

variable "ssh_keyset_name" {
  default = ""
}

variable "ssh_key_path" {
  default = ""
}

variable "region" {
  default = "us-east-1"
}

variable "zone" {
  default = "us-east-1a"
}

variable "master_size" {
  default = "t2.medium"
}

variable "worker_size" {
  default = "t2.medium"
}
