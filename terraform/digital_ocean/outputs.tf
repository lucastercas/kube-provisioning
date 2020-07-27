output "public-ipv4_adresses" {
  value = [
    digitalocean_droplet.loadbalancer.*.ipv4_address,
    digitalocean_droplet.worker.*.ipv4_address,
    digitalocean_droplet.master.*.ipv4_address,
  ]
  description = "Public IP of the VMsc"
}

# output "loadbalancer-ipv4_addresses" {
#   value = [
#     "${digitalocean_droplet.loadbalancer.*.ipv4_address_private}"
#   ]
# }

# output "master-ipv4_addresses" {
#   value = []
# }

# output "worker-ipv4_addresses" {
#   value = [
#     "${digitalocean_droplet.worker.*.ipv4_address}",
#     "${digitalocean_droplet.worker.*.ipv4_address_private}"
#   ]
# }
