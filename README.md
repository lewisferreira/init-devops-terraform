## Example of var.clusters

clusters={
  "k8s_faulcluster" = {
    region="nyc1"
    nodepools=[
      {
        name="default"
        size="s-1vcpu-2gb"
        node_count=2
        tags=["backend"]
      }
    ]
  }
}
