VERSION := $(shell python -m version)

all:
	@echo "Welcome! This project is running App version $(VERSION)"
	@echo ""
	@echo "The following are common commands:"
	@echo ""
	@echo "make tag"
	@echo "make cloudbuild"
	@echo "make deploy"

cloudbuild:
	@scripts/build.sh

deploy:
	@scripts/deploy.sh

tag:
	@scripts/tag.sh
