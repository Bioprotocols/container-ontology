ifndef M4
    ifneq (, $(shell which gm4))
      M4 ?= gm4
    else ifneq (, $(shell which m4))
      M4 = m4
    else
      $(error "No m4 or gm4 in $(PATH), please set the M4 variable")
    endif
endif

HOST_PORT ?= 8080

GIT_BRANCH := $(shell git rev-parse --abbrev-ref HEAD)

URL_PREFIX = https://raw.githubusercontent.com/rpgoldman/container-ontology/${GIT_BRANCH}/owl

turtle_files = container-ontology.ttl om-subset.ttl strateos-catalog-individuals.ttl

catalog_file = catalog-v001.xml

makeFileDir := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

.PHONY: server

all: $(turtle_files) $(catalog_file)

$(turtle_files): %.ttl: %.m4
	$(M4) -D URL_PREFIX=$(URL_PREFIX) -D OUTNAME=$(@F) $< > $@

$(catalog_file): %.xml: %.m4
	$(M4) -D URL_PREFIX=$(URL_PREFIX) -D OUTNAME=$(@F) $< > $@


server: $(turtle_files)
	mkdir -p $(makeFileDir)server-files
	cp $(turtle_files) $(makeFileDir)server-files
	rm -f $(makeFileDir)server-files/.DS_Store
	docker run --rm -p $(HOST_PORT):8080 -v $(makeFileDir)/server-files:/srv/owl -v $(makeFileDir)owlery-conf:/srv/conf owlery:latest | tee server.log
