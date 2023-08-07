FROM alpine:latest

RUN apk add --update npm maven

COPY --from=docker:dind /usr/local/bin/docker /usr/local/bin/
