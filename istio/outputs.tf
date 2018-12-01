output "aws_nodes" {
  value = "${module.aws_cluster.nodes}"
}

output "azure_nodes" {
  value = "${module.azure_cluster.nodes}"
}
