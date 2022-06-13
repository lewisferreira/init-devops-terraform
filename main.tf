module "mycluster" {
  source         = "./modules/cluster"

  for_each       = var.clusters
  cluster_name   = each.key
  cluster_region = each.value.region
  cluster_nodepools = each.value.nodepools
}
