# WIP: NKS Cloud Volumes for AWS

### Module Requirements

* Base [NKS module](https://github.com/StackPointCloud/tf_nks_tests) requirements
* AWS access key and secret key
* API key and secret key for Cloud Volumes for AWS

### Module Configuration

`main.tf`:

```
module "cvs_aws_test" {
  source = "github.com/StackPointCloud/tf_nks_tests/cvs_aws"

  aws_access_key = "AWS_ACCESS_KEY"
  aws_secret_key = "AWS_SECRET_KEY"
  ssh_key_path   = "/path/to/ssh/id_rsa.pub"
  cvs_api_key    = "CVS_API_KEY"
  cvs_secret_key = "CVS_SECRET_KEY"
}
```
## Module Parameters

* `aws_access_key` - AWS access key.
* `aws_secret_key` - AWS secret key.
* `aws_keyset_name` - Existing NKS provider keyset name (AWS keys and provider keyset name are mutually exclusive).
* `ssh_key_path` - Path to the public SSH key (`ssh_key_path` and `ssh_keyset_name` are mutually exclusive).
* `ssh_keyset_name` - Existing NKS SSH keyset name.
* `cvs_api_key` - CVS API key
* `cvs_secret_key` - CVS API secret key.
* `region` - (default: us-east-1)
* `zone` - (default: us-east-1a)
* `master_size` - (default: t2.medium)
* `worker_size` - (default: t2.medium)
