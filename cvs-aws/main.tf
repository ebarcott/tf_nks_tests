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

  provider_code        = "aws"
  cluster_name         = "TF - Cloud Volumes for AWS Test"
  kubeconfig_path      = "kubeconfig"
  provider_keyset_name = "${var.aws_keyset_name}"
  aws_access_key       = "${var.aws_access_key}"
  aws_secret_key       = "${var.aws_secret_key}"
  ssh_keyset_name      = "${var.ssh_keyset_name}"
  ssh_key_path         = "${var.ssh_key_path}"
  region               = "${var.region}"
  zone                 = "${var.zone}"
  master_size          = "${var.master_size}"
  worker_size          = "${var.worker_size}"
}

# -----------------------------------------------------------------------------
# Deploy CVS on AWS
# -----------------------------------------------------------------------------
resource "nks_keyset" "cvsaws_keyset" {
  org_id   = "${module.aws_cluster.org_id}"
  name     = "TF - Cloud Volumes AWS Keyset"
  category = "solution"
  entity   = "cvsaws"
  keys     = [
    {
      key_type = "pvt"
      key      = "${var.cvs_api_key}"
    },
    {
      key_type = "pub"
      key      = "${var.cvs_secret_key}"
    }
  ]
}

resource "nks_solution" "cvs_aws" {
  org_id     = "${module.aws_cluster.org_id}"
  cluster_id = "${module.aws_cluster.cluster_id}"
  keyset     = "${nks_keyset.cvsaws_keyset.id}"
  solution   = "cvsaws"
}

# -----------------------------------------------------------------------------
# Configure Kubernetes cluster
# -----------------------------------------------------------------------------
provider "kubernetes" {
  load_config_file = true
  config_path      = "kubeconfig"
}

resource "kubernetes_persistent_volume_claim" "cvs_aws" {
  depends_on = ["nks_solution.cvs_aws"]
  metadata {
    name = "cvsaws"
  }
  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests {
        storage = "1Gi"
      }
    }
    storage_class_name = "aws-cvs"
  }
}
