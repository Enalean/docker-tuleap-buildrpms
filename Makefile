CMD=/run.sh --folder=rhel6 --php=php

build:
	docker build -t cbayle/docker-tuleap-buildrpms:1.0 .

run:
	docker run --rm=true -t -i \
		--privileged=true \
		-v $$(dirname $(CURDIR))/tuleap:/tuleap \
		-v $$(dirname $(CURDIR))/srpms:/srpms \
		-v $$(dirname $(CURDIR))/rpms:/tmp/build \
		cbayle/docker-tuleap-buildrpms:1.0 $(CMD)

