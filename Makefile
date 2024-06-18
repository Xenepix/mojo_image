

build:
	docker build . -t base_mojo_image

save:
	docker build . -t base_mojo_image && docker save base_mojo_image | gzip > base_mojo_image.tar.gz

load:
	docker load < ./base_mojo_image.tar.gz

exp: build
    	@container_id_file=$(shell docker ps -qf "ancestor=base_mojo_image" > /tmp/container_id.txt) \
    	@if [ -s /tmp/container_id.txt ]; then \
        	docker export $(cat /tmp/container_id.txt) -o test.tar; \
        	gzip test.tar; \
        	rm /tmp/container_id.txt; \
    	else \
        	echo "Aucun conteneur correspondant trouvé."; \
    	fi

