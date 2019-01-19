export MAKEFLAGS += --warn-undefined-variables
export SHELL := /bin/bash -o pipefail

export PROJECT_SHA ?= $(shell git rev-parse HEAD)
export PROJECT_VERSION ?= v0.0.0-dev
export PROJECT_RELEASE ?= dev
export CHART_BACKEND_APP_VERSION = $(shell if [[ "$(PROJECT_VERSION)" == "v0.0.0-dev" ]]; then echo "master-staging"; else echo $(PROJECT_VERSION); fi)

ci: lint package

lint:
	katacoda validate-all

package:
	# TODO: make that good
	cp -a ./common/common-*.sh ./install-on-kubernetes/assets
	cp -a ./common/background.sh ./install-on-kubernetes
	cp -a ./common/_setup.md ./install-on-kubernetes

	cp -a ./common/common-*.sh ./playground-k8s/assets
	cp -a ./common/background.sh ./playground-k8s
	cp -a ./common/_setup.md ./playground-k8s

	cp -a ./common/common-*.sh ./playground-linux/assets
	cp -a ./common/background.sh ./playground-linux
	cp -a ./common/_setup.md ./playground-linux

publish: package
	katacoda push
