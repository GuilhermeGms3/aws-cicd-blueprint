.PHONY: test docker-build tf-init tf-plan

test:
	pip install -r app/requirements.txt
	pytest app/tests -q

docker-build:
	docker build -t aws-cicd-blueprint .

tf-init:
	cd infra/terraform && terraform init

tf-plan:
	cd infra/terraform && terraform plan
