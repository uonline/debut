all: deps

deps:
	./tools/gendeps.sh

run: deps
	instead -hinting 3 -debug ../debut
