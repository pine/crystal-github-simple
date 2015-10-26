.PHONY: all install test

all: install test

install:
	crystal deps

test:
	crystal spec
