ifeq ($(OS),Windows_NT)
    OS = windows
else
    UNAME_S := $(shell uname -s)
    ifeq ($(UNAME_S),Linux)
	OS = linux
    endif
    ifeq ($(UNAME_S),Darwin)
	OS = darwin
    endif
endif

TERRAFORM_VERSION=0.12.0
TERRAFORM_URL := https://releases.hashicorp.com/terraform/$(TERRAFORM_VERSION)/terraform_$(TERRAFORM_VERSION)_$(OS)_amd64.zip

PATH := $(shell pwd)/output:$(PATH)

ENVIRONMENT := production

dependencies:
	@if [ ! -d output ]; then mkdir output; fi
	@if [ ! -f output/terraform.zip ]; then curl -o output/terraform.zip $(TERRAFORM_URL); fi
	@if [ ! -f output/terraform ]; then unzip -d output/ output/terraform.zip; echo "Unzipping"; fi

init: dependencies
	@if [ -d output/tf ]; then rm -rf output/tf; fi
	PATH=$(PATH) terraform init tf

provision: dependencies
	PATH=$(PATH) terraform plan -var-file=vars/$(ENVIRONMENT).tfvars tf
	PATH=$(PATH) terraform apply -var-file=vars/$(ENVIRONMENT).tfvars tf

destroy:
	PATH=$(PATH) terraform plan -destroy -var-file=vars/$(ENVIRONMENT).tfvars tf
	PATH=$(PATH) terraform destroy -force -var-file=vars/$(ENVIRONMENT).tfvars tf

clean:
	@if [ -d output ]; then rm -rf output; fi


