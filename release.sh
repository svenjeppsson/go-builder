bp
docker build -t xthinker/go-builder:$(cat VERSION).
docker tag xthinker/go-builder:$(cat VERSION) xthinnker/go-builder:latest
docker push xthinker/go-builder:$(cat VERSION)
docker push xthinker/go-builder:latest
