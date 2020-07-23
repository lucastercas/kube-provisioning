output "loadbalancer-ipv4_addresses" {
  value = ["${digitalocean_droplet.loadbalancer.*.ipv4-address}"]
}

output "master-ipv4_addresses" {
  value = ["${digitalocean_droplet.master.*.ipv4-address}"]
}

output "worker-ipv4_addresses" {
  value = ["${digitalocean_droplet.worker.*.ipv4-address}"]
}
