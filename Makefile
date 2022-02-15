deploy:
	bash deploy.sh

install:
	bash install.sh
	bash deploy.sh

export:
	bash export.sh

check:
	shellcheck ./*.sh
	shellcheck ./zsh/.zsh/*.zsh

mod:
	chmod 744 home/bin/*

