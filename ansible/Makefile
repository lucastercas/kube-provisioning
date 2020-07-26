.PHONY: ansible run_playbook create_role

# Create a role with all the right structure according to ansible-galaxy
create_role:
	ansible-galaxy init $(role) --init-path=./roles

# Install a role from ansible-galaxy repository
install_role:
	ansible-galaxy install $(role)

# Install requires roles, described in the requirements.txt file
install_requirements:
	ansible-galaxy install -r requirements.yml

# Run the loadbalancers playbook
loadbalancers:
	ansible-playbook -i hosts.yml playbooks/configure_loadbalancers.yml

# Run the configure_nodes playbook
nodes:
	ansible-playbook -i hosts.yml playbooks/configure_nodes.yml

# Run the masters playbooks
masters:
	ansible-playbook -i hosts.yml playbooks/initializer_masters.yml

# Run the workers playbook
workers:
	ansible-playbook -i hosts.yml playbooks/add_workers.yml

# Run the main playbook
run:
	ansible-playbook -i hosts.yml.yml site.yml