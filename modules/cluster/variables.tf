variable "cluster_name" {
  default = "k8s_faulcluster"
}

variable "cluster_region" {
  default = "nyc1"
}

variable "cluster_nodepools" {
  default = {
    "default" = {
      size       = "s-1vcpu-2gb"
      node_count = 1
      tags       = ["backend"]
    }
  }
}
