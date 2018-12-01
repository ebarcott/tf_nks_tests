# -----------------------------------------------------------------------------
# Module variables
#
# Note: `ssh_keyset_name` and `ssh_key_path` are mutually exclusive.
#
#       `provider_keyset_name` and provider credential variables are mutually
#        exclusive.
# -----------------------------------------------------------------------------
variable "ssh_keyset_name" {
  description = "SSH keyset name from NKS"
  default     = ""
}

variable "ssh_key_path" {
  description = "Path to local SSH public key file"
  default     = ""
}

variable "aws_keyset_name" {
  default = ""
}

variable "aws_access_key" {
  default = ""
}

variable "aws_secret_key" {
  default = ""
}

variable "azure_keyset_name" {
  default = ""
}

variable "azure_client_id" {
  default = ""
}

variable "azure_client_secret" {
  default = ""
}

variable "azure_tenant_id" {
  default = ""
}

variable "azure_subscription_id" {
  default = ""
}
