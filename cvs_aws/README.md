## Requirements

* [NKS API token](https://stackpoint.io/user/profile)
* AWS access key and secret key
* API key and secret key for Cloud Volumes for AWS

## Example Usage

1. Set the NKS API token. 

```
export NKS_API_TOKEN=[your NKS API token]
```

2. Create `main.tf` with the following:

```
module "cvs_aws_test" {
  source = "github.com/StackPointCloud/tf_nks_tests/cvs_aws"

  aws_access_key = "AWS_ACCESS_KEY"
  aws_secret_key = "AWS_SECRET_KEY"
  ssh_key_path   = "/path/to/ssh/id_rsa.pub"
  cvs_api_key    = "CVS_API_KEY
  cvs_secret_key = "CVS_SECRET_KEY"
}
```

3 Run Terraform.


```
terraform init
terraform plan
terraform apply
```

Note: _The NKS provider binary for Terraform must be manually installed until it is officially released._

Optional module parameters:

* `aws_keyset_name`: Existing NKS provider keyset name.
* `ssh_keyset_name`: Existing NKS SSH keyset name.
* `region`: (default: us-east-1)
* `zone`: (default: us-east-1a)
* `master_size`: (default: t2.medium)
* `worker_size`: (default: t2.medium)
