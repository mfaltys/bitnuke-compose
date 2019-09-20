IMAGE_NAME_BITNUKE=unixvoid/bitnuke
IMAGE_NAME_NGINX=unixvoid/nginx
IMAGE_NAME_REDIS=unixvoid/redis
DOCKER_OPTIONS="--no-cache"
DOCKER_PREFIX=sudo

build: update_data
	# build bitnuke
	cd bitnuke/ && \
		wget https://cryo.unixvoid.com/bin/bitnuke/v0.20.2/bitnuke-latest-linux-amd64 && \
		chmod +x bitnuke* && \
		$(DOCKER_PREFIX) docker build $(DOCKER_OPTIONS) -t $(IMAGE_NAME_BITNUKE) . && \
	cd ../redis/ && \
		wget https://cryo.unixvoid.com/bin/redis/filesystem/rootfs.tar.gz && \
		$(DOCKER_PREFIX) docker build $(DOCKER_OPTIONS) -t $(IMAGE_NAME_REDIS) .

update_data:
	cd nginx/ && \
		git clone https://github.com/unixvoid/bitnuke && \
		mv bitnuke/deps/data/ . && \
		rm -rf bitnuke/

compose:
	$(DOCKER_PREFIX) docker-compose up


clean:
	rm -f bitnuke/bitnuke-latest*
	rm -f redis/rootfs.tar.gz
	rm -rf nginx/data
	rm -rf nginx/bitnuke
