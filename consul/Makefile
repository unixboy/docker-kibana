.PHONY: build push run
VERSION := 4.0.2
APP_NAME := kibana
ES_HOST := $(shell boot2docker ip):9200

build:
	docker build -t novilabs/$(APP_NAME):consul .

tag-version: build
	docker tag -f novilabs/$(APP_NAME):consul novilabs/$(APP_NAME):$(VERSION)-consul

run:
	docker run --rm -ti --name kibana\
	 -p 5601:5601\
	 -e "CONSUL_HOST_ADDR=192.168.59.103:8500"\
	 -e "ES_HOST=$(ES_HOST)"\
	 -e "NODE_ENV=production"\
	 -e "CONFIG_PATH=/etc/kibana/config/kibana.yml"\
	 novilabs/$(APP_NAME):$(VERSION)-consul
