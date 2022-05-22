image_nginx=tylergeery/gd-image-nginx

.PHONY: build-image provision-server renew-cert deploy-nginx backup-db
.DEFAULT_GOAL:=help

provision-server:  ## Provision a newly created ec2 instance
	ansible-playbook ./ansible/provision_server.yml

renew-cert:  ## Renew SSL cert for geerydev.com
	ansible-playbook ./ansible/renew_cert.yml

build-image:  ## Build and push new nginx docker image
	docker build -f ./nginx/Dockerfile -t $(image_nginx) ./nginx
	docker push $(image_nginx)

deploy-nginx:  ## Deploy new version of nginx server
	ansible-playbook ./ansible/deploy_nginx.yml

backup-db:  ## Pull down local backup of DB
	ansible-playbook ./ansible/db_backup.yml

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
