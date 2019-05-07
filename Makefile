GO_ON = GO111MODULE=on GOPROXY=https://proxy.golang.org go
GO_OFF = GO111MODULE=off go

all: fmt imports lint test

fmt:
	gofmt -w hello.go

imports:
	goimports -w hello_test.go

lint:
	${GO_ON} list | xargs golint

test:
	${GO_ON} test

bootstrap:
	${GO_OFF} get github.com/golang/go/src/cmd/gofmt
	${GO_OFF} get golang.org/x/tools/cmd/goimports
	${GO_OFF} get golang.org/x/lint/golint
