# Xen Server K8s Provision and Configuration

This repo aims to provide an easy way to provision and
configure nodes for a Kubernetes cluster using XenServer
VMs as nodes.

## Caveats

Currently, it only supports one host of Xen Server, and
a external 
[etcd cluster topology](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/ha-topology/).

The aim is to be able to provision nodes on multiple hosts of Xen Server,
so the cluster can be truly high availability.