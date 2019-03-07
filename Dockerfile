FROM golang:1.11 as go-builder
LABEL maintainer="Sven Jeppsson <sven@jeppsson.de>"
RUN curl -fsSL -o /usr/local/bin/dep https://github.com/golang/dep/releases/download/v0.5.0/dep-linux-amd64 && chmod +x /usr/local/bin/dep
RUN go get -u github.com/golangci/golangci-lint/cmd/golangci-lint
RUN go get -u github.com/wadey/gocovmerge
COPY build.sh /bin/
RUN chmod u+x /bin/build.sh
VOLUME /go/src/app
CMD pwd
WORKDIR /go/src/app
ENTRYPOINT [ "build.sh" ]