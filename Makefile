# These targets are not files
.PHONY: tests

tests:
	./bin/test

sync:
	aws s3 sync --acl public-read share s3://dulaccc-buildpack-geodjango/

tools:
	git clone https://github.com/kennethreitz/pip-pop.git
	mv pip-pop/bin/* vendor/pip-pop/
	rm -fr pip-pop
