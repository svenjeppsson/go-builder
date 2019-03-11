#!/usr/bin/env bash
dep ensure
go fmt ./...
rm cov.out
rm -rf mocks
mockery -all -dir interfaces
golangci-lint run
go vet .
go test -v ./... -coverprofile=cov.out.tmp
go test . -coverprofile cover.out.tmp
cat cover.out.tmp | grep -v "mocks" > cover.out
go tool cover -func cover.out
if [ -n "$UID" -a -n "$GID" ]; then
  chown -R $UID:$GID *
fi
