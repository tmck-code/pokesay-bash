.PHONY: build

build:
	docker build -f ops/Dockerfile -t ppokemonsay:latest .
	docker run -it --name pokebuilder ppokemonsay:latest bash -c "/usr/local/src/build.sh /usr/local/src/icons /tmp"
	docker cp pokebuilder:/tmp/ .
