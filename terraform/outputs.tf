output "loadbalancer-ipv4_addresses" {
  value = ["${digitalocean_droplet.loadbalancer.*.ipv4_address}"]
}

output "master-ipv4_addresses" {
  value = ["${digitalocean_droplet.master.*.ipv4_address}"]
}

output "worker-ipv4_addresses" {
  value = ["${digitalocean_droplet.worker.*.ipv4_address}"]
}
