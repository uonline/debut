all: lint deps

lint:
	find -name '*.lua' -exec luac -p '{}' '+'
	@echo Syntax check OK.

deps:
	./tools/gendeps.sh

run: lint deps
	instead -hinting 3 -debug ../debut

release: lint deps
	# Prepare build directory
	rm -rf __build
	mkdir __build
	# Copy source files
	cp *.lua __build/
	cp -r engine __build/
	cp -r src __build/
	# Run preprocessor
	sed -i "s|--<<BUILD_DEBUG>>|DEBUG = false|g" __build/main.lua
	sed -i "s|--<<BUILD_DATE>>|BUILD_DATE = '$$(date --rfc-2822)'|g" __build/main.lua
	sed -i "s|--<<BUILD_COMMIT>>|BUILD_COMMIT = '$$(git show --stat HEAD | cut -d' ' -f2 | head -n1)'|g" __build/main.lua
	# Create game archive
	rm -f release.zip
	7z a release.zip __build/
	rm -rf __build
