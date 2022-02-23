HOST_PORT ?= 8080

GIT_BRANCH := $(shell git rev-parse --abbrev-ref HEAD)

# Previously, this was based on git branch, but that was not tenable
URL_PREFIX = https://raw.githubusercontent.com/rpgoldman/container-ontology/main/owl
FILE_PREFIX = /srv/owl

turtle_files = container-ontology.ttl om-subset.omn strateos-catalog.ttl bbn-plate-catalog.ttl all-catalogs.ttl sbolowl3.rdf

catalog_file = catalog-v001.xml

server_catalog_file = owlery-catalog.xml

DOCKER_IMAGE ?= phenoscape/owlery # was rpgoldman/owlery

makeFileDir := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# -Dorg.slf4j.simpleLogger.logFile=/srv/owlery.log 
JAVA_ARGS := '-Dorg.slf4j.simpleLogger.defaultLogLevel=DEBUG -Dlogback.configurationFile=/srv/conf/logback.xml -Dconfig.file=/srv/conf/application.conf' # -Dlog4j.configurationFile=/srv/conf/log4j.xml"

.PHONY: server

server: ${server_catalog_file}
	mkdir -p $(makeFileDir)server-files
	cp $(turtle_files) $(makeFileDir)server-files
	cp $(server_catalog_file) $(makeFileDir)server-files
	rm -f $(makeFileDir)server-files/.DS_Store
	docker run --rm --env JAVA_OPTS=$(JAVA_ARGS) -p $(HOST_PORT):8080 -v $(makeFileDir)/server-files:/srv/owl -v $(makeFileDir)owlery-conf:/srv/conf $(DOCKER_IMAGE):latest 2>&1 | tee server.log
