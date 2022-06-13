resource "digitalocean_kubernetes_cluster" "main" {
  name   = var.cluster_name
  region = var.cluster_region
  # Grab the latest version slug from `doctl kubernetes options versions`
  version = "1.22.8-do.1"

  dynamic "node_pool" {
    for_each = var.cluster_nodepools
    content {
      name       = node_pool.value.name
      size       = node_pool.value.size
      node_count = node_pool.value.node_count
      tags       = node_pool.value.tags  
    }
  }
}

resource "local_file" "main" {
  content = digitalocean_kubernetes_cluster.main.kube_config.0.raw_config
  filename = "${path.root}/kubeconfig-${var.cluster_name}.yaml"
}
