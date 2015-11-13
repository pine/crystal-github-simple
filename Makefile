.PHONY: default all
default: all
all: install build test

.PHONY: install test
install:
	crystal deps

build:
	mkdir -p bin
	crystal build --release example/commits.cr -o bin/commits
	crystal build --release example/events.cr -o bin/events

test:
	crystal spec
