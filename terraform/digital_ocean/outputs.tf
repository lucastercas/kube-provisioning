output "loadbalancer_public" {
  value = [
    digitalocean_droplet.loadbalancer.*.ipv4_address
  ]
}

output "controlplane_public" {
  value = [
    digitalocean_droplet.master.*.ipv4_address
  ]
}

output "workers_public" {
  value = [
    digitalocean_droplet.worker.*.ipv4_address
  ]
}
