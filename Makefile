
.PHONY: build_web
build_web:
	cd web && npm run build

.PHONY: build_darwin
build_darwin: build_web
	set GOOS=darwin
	set GOARCH=amd64
	go build -o darwin_bin/ginvue main.go

.PHONY: build_linux
build_linux: build_web
	set GOOS=linux
	set GOARCH=386
	go build -o linux_bin/ginvue main.go

.PHONY: build_windows
build_windows: build_web
	set GOOS=windows
	set GOARCH=386
	go build -o windows_bin/ginvue main.go
