dot_dir := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

deploy:
	@bash $(dot_dir)/deploy.sh

install:
	@bash $(dot_dir)/install.sh
	@bash $(dot_dir)/deploy.sh

export:
	@bash $(dot_dir)/export.sh

check:
	shellcheck ./*.sh
	shellcheck ./zsh/.zsh/*.zsh

mod:
	chmod 744 home/bin/*

test:
	@echo $(dot_dir)

