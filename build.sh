#!/usr/bin/env bash
dep ensure
go fmt ./...
golangci-lint run
go vet .
go test -v ./... -run ^TestIntegration -coverprofile=cov1.out
go test -v ./... -run ^TestUnit -coverprofile=cov2.out
gocovmerge cov1.out cov2.out > cov.out
cat cov.out