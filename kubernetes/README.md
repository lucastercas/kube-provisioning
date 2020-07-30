# Test App for Kubernetes

## To-Do

## Commands

1. kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep admin-user | awk '{print $1}')

## Directories

### 1. Ingress
A solução de DNS para kubernetes, atualmente é usado o nginx-ingress

### 2. Spring App

### 3. Prometheus

### 4. Kubernetes Dashboard

### 5. Kube State Metrics

### 6. Node Exporter

## References

1. https://medium.com/@Oskarr3/setting-up-ingress-on-minikube-6ae825e98f82
1. https://pwittrock.github.io/docs/tutorials/stateless-application/hello-minikube/
