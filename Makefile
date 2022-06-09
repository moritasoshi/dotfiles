dot_dir := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

deploy:
	@bash $(dot_dir)/deploy.sh

cleanup:
	@bash $(dot_dir)/cleanup.sh

install:
	@bash $(dot_dir)/install.sh
	@bash $(dot_dir)/deploy.sh

check:
	shellcheck ./*.sh
	shellcheck ./zsh/.zsh/*.zsh

mod:
	chmod 744 home/bin/*

test:
	@echo $(dot_dir)

