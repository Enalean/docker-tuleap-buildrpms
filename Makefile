build:
	docker build -t cbayle/docker-tuleap-buildrpms .

run:
	docker run --rm=true -t -i \
		-v $$(dirname $(CURDIR))/tuleap:/tuleap \
		-v $$(dirname $(CURDIR))/srpms:/srpms \
		-v $$(dirname $(CURDIR))/rpms:/tmp/build \
		cbayle/docker-tuleap-buildrpms /run.sh --folder=rhel6 --php=php53

