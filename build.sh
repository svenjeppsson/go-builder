#!/usr/bin/env bash
dep ensure
go fmt ./...
rm cov.out
rm -rf mocks
mockery -all -dir interfaces
golangci-lint run
go vet .
go test -v ./... -run ^TestIntegration -coverprofile=cov1.out
go test -v ./... -run ^TestUnit -coverprofile=cov2.out
gocovmerge cov1.out cov2.out > cov.out
rm cov1.out
rm cov2.out
chown -R $UID:$GID *