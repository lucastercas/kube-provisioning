# Configure Kubernetes Nodes

This role prepares a machine for executing kubernetes. Currently, it
can only handle Debian machines.

## Steps

- Ensures the packages required for the next steps are present
- Remove old versions of docker
- Configure apt to install correct version of Docker
  - Add gpg key and add repo to apt
- Configure apt to install correct version of kubernetes
  - Add gpg key and add repo to apt
- Install docker and kubernetes
- Start services
- Disable swap

## To Do

1. Add support for other OSes:
   - Add correct checks
