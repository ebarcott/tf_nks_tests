# WIP: Istio deployment with NKS

This is a proof of concept using NKS provider for Terraform to deploy two cross-provider clusters and Istio.

### Module Requirements

* Base [NKS module](https://github.com/StackPointCloud/tf_nks_tests) requirements
* AWS access key and secret key (or existing NKS provider keyset)
* Azure tenant, subscription, and client credentials (or existing NKS provider keyset)

### Module Configuration

`main.tf`:

```
module "istio_test" {
  source = "github.com/StackPointCloud/tf_nks_tests/istio"

  aws_access_key        = "AWS_ACCESS_KEY"
  aws_secret_key        = "AWS_SECRET_KEY"
  azure_client_id       = "AZURE_CLIENT_ID"
  azure_client_secret   = "AZURE_CLIENT_SECRET"
  azure_tenant_id       = "AZURE_TENANT_ID"
  azure_subscription_id = "AZURE_SUBSCRIPTION_ID"
  ssh_key_path          = "/path/to/ssh/id_rsa.pub"

  // aws_keyset_name   = "NKS AWS provider keyset name"
  // azure_keyset_name = "NKS Azure provider keyset name"
  // ssh_keyset_name   = "NKS SSH keyset name"
}
```

### Module Parameters

* `aws_access_key`
* `aws_secret_key`
* `aws_keyset_name`
* `azure_client_id`
* `azure_client_secret`
* `azure_tenant_id`
* `azure_subscription_id`
* `azure_keyset_name`
* `ssh_keyset_name`
* `ssh_key_path`

**Notes**:

* `provider_keyset_name` and provider credential variables are mutually.
* `ssh_keyset_name` and `ssh_key_path` are mutually exclusive.

## Limitations

* Further Istio configuration is not available through the NKS API and provider.
* Need to allow customizable regions, zones, etc.
