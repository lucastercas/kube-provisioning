.PHONY: ansible run_playbook create_role

ansible:
	ansible $(cmd)

run_playbook:
	ansible-playbook -i hosts.yml site.yml -v

create_role:
	ansible-galaxy init $(role) --init-path=/etc/ansible/roles

install_role:
	ansible-galaxy install $(role)

install_requirements:
	ansible-galaxy install -r requirements.txt