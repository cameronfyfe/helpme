_:
	@just --list

fmt:
	shfmt --indent 2 --write ./helpme

fmt-check:
	shfmt --indent 2 --diff ./helpme

