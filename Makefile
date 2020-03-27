image_nginx=tylergeery/gd-image-nginx

.PHONY: build-image

build-image:
	docker build -f Dockerfile -t $(image_nginx) ./nginx
	docker push $(image_nginx)