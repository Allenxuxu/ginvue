
.PHONY: build
build:
	rm -rf static/css static/img static/js static/favicon.ico static/index.html
	cd web && npm run build
	go build -o bin/ginvue main.go
