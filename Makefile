

build:
	docker build . -t base_mojo_image

save:
	docker build . -t base_mojo_image && docker save base_mojo_image | gzip > base_mojo_image.tar.gz

load:
	docker load < ./base_mojo_image.tar.gz

