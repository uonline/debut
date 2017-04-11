all: lint deps

lint:
	find -name '*.lua' -exec luac -p '{}' '+'
	@echo Syntax check OK.

deps:
	./tools/gendeps.sh

run: lint deps
	instead -hinting 3 -debug ../debut
