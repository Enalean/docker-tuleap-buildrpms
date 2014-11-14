build:
	docker build -t cbayle/docker-tuleap-buildrpms .

run:
	docker run --rm=true -t -i \
		-v $$(dirname $(CURDIR))/tuleap:/tuleap \
		-v $$(dirname $(CURDIR))/srpms:/srpms \
		cbayle/docker-tuleap-buildrpms /run.sh --folder=rhel6 --php=php53

