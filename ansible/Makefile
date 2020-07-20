.PHONY: run

ansible:
	ansible $(cmd)

run_playbook:
	ansible-playbook -i hosts.yml site.yml -vv

create_role:
	ansible-galaxy init $(role) --init-path=/etc/ansible/roles