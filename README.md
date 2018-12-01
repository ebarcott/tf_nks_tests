# NKS provider modules for Terraform

**Note**: _The [NKS provider plugin](https://github.com/StackPointCloud/terraform-provider-nks) binary for Terraform must be compiled and manually installed until officially released._

### Base Requirements

* NKS API token - [https://stackpoint.io](https://stackpoint.io) / Edit Profile / API Tokens

### Usage

1. Next set the NKS_API_TOKEN environment variable and, optionally, the NKS_BASE_API_URL.

```
export NKS_API_TOKEN=[token]
export NKS_BASE_API_URL=https://api-staging.stackpoint.io/
```

2. Create `main.tf` with the appropriate module parameters:

* [Cloud Volumes for AWS](https://github.com/StackPointCloud/tf_nks_tests/tree/master/cvs_aws)
* [Istio](https://github.com/StackPointCloud/tf_nks_tests/tree/master/istio)

3. Initialize and apply the Terraform manifest.

```
terraform init
terraform plan
terraform apply
```
