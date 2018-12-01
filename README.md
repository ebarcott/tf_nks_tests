# NKS provider modules for Terraform

**Note**: _The [NKS provider plugin](https://github.com/StackPointCloud/terraform-provider-nks) binary for Terraform must be compiled and manually installed until officially released._

### Base Requirements

* NKS API token - [https://stackpoint.io](https://stackpoint.io) / Edit Profile / API Tokens

### Example Usage

1. Set the NKS API token.

```
export NKS_API_TOKEN=[your NKS API token]
export NKS_BASE_API_URL=[staging API URL]
```

2. Create `main.tf` with the appropriate module parameters:

* [Cloud Volumes for AWS](https://github.com/StackPointCloud/tf_nks_tests/tree/master/cvs_aws)

3. Run Terraform.

```
terraform init
terraform plan
terraform apply
```
