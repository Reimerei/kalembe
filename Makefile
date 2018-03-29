image=hexo-build-image
hexo_bin=/source/node_modules/hexo/bin/hexo
docker_run=docker run -it --rm --volume $(PWD):/source

setup:
	docker pull node
	docker build -t hexo-build-image .
	$(docker_run) $(image) npm install

console:
	$(docker_run) $(image) /bin/bash

generate:
	$(docker_run) $(image) $(hexo_bin) generate

watch:
	$(docker_run) $(image) $(hexo_bin) generate -w

server:
	$(docker_run) --publish 4000:4000 $(image) $(hexo_bin) server -s -l

deploy: generate
	$(docker_run) -v $(SSH_AUTH_SOCK):/ssh-agent -e SSH_AUTH_SOCK=/ssh-agent $(image) $(hexo_bin) deploy