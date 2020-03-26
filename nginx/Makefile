image_nginx=gd-image-nginx
container_nginx=gd-nginx

build:
	docker build -f Dockerfile -t $(image_nginx)
	docker run --network prod -p 80:80 -p 443:443 --name $(container_nginx) -d $(image_nginx)
