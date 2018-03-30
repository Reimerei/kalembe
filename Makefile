image=hexo-build-image
hexo_bin=/source/node_modules/hexo/bin/hexo
docker_run=docker run -it --rm --volume $(PWD):/source

setup:
	docker pull node
	docker build -t hexo-build-image .
	$(docker_run) $(image) npm install

pull:
	git pull

console:
	$(docker_run) $(image) /bin/bash

generate:
	$(docker_run) $(image) $(hexo_bin) generate

watch:
	$(docker_run) --publish 4000:4000 $(image) $(hexo_bin) server -l

server:
	$(docker_run) $(image) $(hexo_bin) server -l

deploy: pull generate
	$(docker_run) -v $(SSH_AUTH_SOCK):/ssh-agent -e SSH_AUTH_SOCK=/ssh-agent $(image) $(hexo_bin) deploy
