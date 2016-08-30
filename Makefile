IMAGE_NAME_BITNUKE=bitnuke
IMAGE_NAME_NGINX=nginx
IMAGE_NAME_REDIS=redis
DOCKER_OPTIONS="--no-cache"
DOCKER_PREFIX=sudo

build:
	# build bitnuke
	cd bitnuke/ && \
		wget https://cryo.unixvoid.com/bin/bitnuke/bitnuke-latest-linux-amd64 && \
		chmod +x bitnuke* && \
		$(DOCKER_PREFIX) docker build $(DOCKER_OPTIONS) -t $(IMAGE_NAME_BITNUKE) . && \
	cd ../nginx/ && \
		$(DOCKER_PREFIX) docker build $(DOCKER_OPTIONS) -t $(IMAGE_NAME_NGINX) . && \
	cd ../redis/ && \
		wget https://cryo.unixvoid.com/bin/redis/filesystem/rootfs.tar.gz && \
		$(DOCKER_PREFIX) docker build $(DOCKER_OPTIONS) -t $(IMAGE_NAME_REDIS) .

compose:
	$(DOCKER_PREFIX) docker-compose up



clean:
	rm -f bitnuke/bitnuke-latest*
	rm -f redis/rootfs.tar.gz
