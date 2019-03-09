FROM golang:1.12.0-stretch as go-builder
LABEL maintainer="Sven Jeppsson <sven@jeppsson.de>"
ENV UID=0
ENV GID=0
RUN curl -fsSL -o /usr/local/bin/dep https://github.com/golang/dep/releases/download/v0.5.0/dep-linux-amd64 && chmod +x /usr/local/bin/dep
RUN go get -u github.com/golangci/golangci-lint/cmd/golangci-lint
RUN go get -u github.com/wadey/gocovmerge
RUN go get -u github.com/vektra/mockery/.../
COPY build.sh /bin/
RUN chmod u+x /bin/build.sh
VOLUME /go/src/app
CMD pwd
WORKDIR /go/src/app
ENTRYPOINT [ "build.sh" ]