Example:

```
module "cvs_aws_test" {
  source = "github.com/StackPointCloud/tf_nks_tests/cvs-aws"

  aws_access_key = "AWS_ACCESS_KEY"
  aws_secret_key = "AWS_SECRET_KEY"
  ssh_key_path   = "/path/to/ssh/id_rsa.pub"
  cvs_api_key    = "CVS_API_KEY
  cvs_secret_key = "CVS_SECRET_KEY"
}
```
