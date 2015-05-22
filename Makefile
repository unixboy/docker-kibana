.PHONY: build tag-version
VERSION := 4.0.2
APP_NAME := kibana

build:
	docker build -t novilabs/$(APP_NAME) .

tag-version: build
	docker tag -f novilabs/$(APP_NAME) novilabs/$(APP_NAME):$(VERSION)
