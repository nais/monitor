.PHONY: all

build: provision.go
	go build -o provision provision.go
