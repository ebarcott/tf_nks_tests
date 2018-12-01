# -----------------------------------------------------------------------------
# Deploy NKS cluster on AWS and Azure w/ Istio
# -----------------------------------------------------------------------------
terraform {
  required_version = ">= 0.11.0"
}

# -----------------------------------------------------------------------------
# Deploy AWS cluster
# -----------------------------------------------------------------------------
module "aws_cluster" {
  source = "github.com/StackPointCloud/tf_nks"

  provider_code = "aws"
  cluster_name  = "TF - Istio 1"

  provider_keyset_name = "${var.aws_keyset_name}"
  aws_access_key       = "${var.aws_access_key}"
  aws_secret_key       = "${var.aws_secret_key}"

  ssh_keyset_name = "${var.ssh_keyset_name}"
  ssh_key_path    = "${var.ssh_key_path}"

  region      = "${var.aws_region}"
  zone        = "${var.aws_zone}"
  master_size = "${var.aws_master_size}"
  worker_size = "${var.aws_worker_size}"
}

resource "local_file" "aws_kubeconfig" {
  depends_on = ["module.aws_cluster"]
  content    = "${module.aws_cluster.kubeconfig}"
  filename   = "./kubeconfig_aws"
}

# -----------------------------------------------------------------------------
# Deploy Istio on AWS
# -----------------------------------------------------------------------------
resource "nks_solution" "aws_istio" {
  org_id     = "${module.aws_cluster.org_id}"
  cluster_id = "${module.aws_cluster.cluster_id}"
  solution   = "istio"
}

# -----------------------------------------------------------------------------
# Deploy Azure cluster
# -----------------------------------------------------------------------------
module "azure_cluster" {
  source = "github.com/StackPointCloud/tf_nks"

  provider_code = "azure"
  cluster_name  = "TF - Istio 2"

  ssh_keyset_name = "${var.ssh_keyset_name}"
  ssh_key_path    = "${var.ssh_key_path}"

  provider_keyset_name  = "${var.azure_keyset_name}"
  azure_client_id       = "${var.azure_client_id}"
  azure_client_secret   = "${var.azure_client_secret}"
  azure_tenant_id       = "${var.azure_tenant_id}"
  azure_subscription_id = "${var.azure_subscription_id}"

  region      = "${var.azure_region}"
  master_size = "${var.azure_master_size}"
  worker_size = "${var.azure_worker_size}"
}

resource "local_file" "azure_kubeconfig" {
  depends_on = ["module.azure_cluster"]
  content    = "${module.azure_cluster.kubeconfig}"
  filename   = "./kubeconfig_azure"
}

# -----------------------------------------------------------------------------
# Deploy Istio on Azure cluster
# -----------------------------------------------------------------------------
resource "nks_solution" "azure_istio" {
  org_id     = "${module.azure_cluster.org_id}"
  cluster_id = "${module.azure_cluster.cluster_id}"
  solution   = "istio"
}
