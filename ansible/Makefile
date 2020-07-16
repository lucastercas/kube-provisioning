.PHONY: run create_role

run:
	ansible-playbook -i hosts.yml site.yml -vvv

create_role:
	docker run -it --rm \
	-v $(CURDIR)/roles:/etc/ansible/roles \
	williamyeh/ansible:alpine3 \
	ansible-galaxy init $(role) --init-path=/etc/ansible/roles