# Initialize master nodes on cluster

## Default Variables

1. `master_control_plane`
2. `master_advertise_ip`
3. `kubernetes_ignore_preflight_errors`
4. `kubernetes_enable_dashboard`
5. `kubernetes_dashboard_manifest`
6. `kubernetes_taint_master`

## Steps

1.

## To Do

1. Add taint master option and command
   1. kubectl taint nodes --all node-role.kubernetes.io/master-
2. kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"
3. kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.34.1/deploy/static/provider/baremetal/deploy.yaml

## References

1. https://pwittrock.github.io/docs/admin/kubeadm
2. https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/
3. https://kubernetes.io/docs/reference/setup-tools/kubeadm/kubeadm/
4. https://kubernetes.io/docs/concepts/cluster-administration/addons/#networking-and-network-policy
