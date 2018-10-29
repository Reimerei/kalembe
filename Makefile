image=node
hexo_bin=/source/node_modules/hexo/bin/hexo
docker_run=docker run -it --rm --volume $(PWD):/source -w /source

setup:
	docker pull node
	$(docker_run) $(image) npm install

update:
	$(docker_run) $(image) npm update

console:
	$(docker_run) $(image) /bin/bash

generate:
	$(docker_run) $(image) $(hexo_bin) generate

watch:
	$(docker_run) --publish 4000:4000 $(image) $(hexo_bin) server -l

server:
	$(hexo_bin) server -l
