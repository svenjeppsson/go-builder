#!/usr/bin/env bash
dep ensure
go fmt ./...
rm cov.out
rm -rf mocks
mockery -all -dir interfaces
golangci-lint run
go vet .
go test -v ./... -coverprofile=cov.out
chown -R $CONTAINER_UID:$CONTAINER_GID *