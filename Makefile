
.PHONY: build_web
build_web:
	rm -rf static/css static/img static/js static/favicon.ico static/index.html
	cd web && npm run build

.PHONY: build_darwin
build_darwin: build_web
	rm -rf static/css static/img static/js static/favicon.ico static/index.html
	cd web && npm run build
	set GOOS=darwin
	set GOARCH=amd64
	go build -o darwin_bin/ginvue main.go

.PHONY: build_linux
build_linux: build_web
	rm -rf static/css static/img static/js static/favicon.ico static/index.html
	cd web && npm run build
	set GOOS=linux
	set GOARCH=386
	go build -o linux_bin/ginvue main.go

.PHONY: build_windows
build_windows: build_web
	rm -rf static/css static/img static/js static/favicon.ico static/index.html
	cd web && npm run build
	set GOOS=windows
	set GOARCH=386
	go build -o windows_bin/ginvue main.go
