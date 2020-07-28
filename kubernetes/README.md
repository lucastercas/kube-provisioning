# Test App for Kubernetes

## To-Do

## Commands

1. kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep admin-user | awk '{print $1}')

## References

1. https://medium.com/@Oskarr3/setting-up-ingress-on-minikube-6ae825e98f82
2. https://pwittrock.github.io/docs/tutorials/stateless-application/hello-minikube/
