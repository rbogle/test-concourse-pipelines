FROM alpine:latest as resource

ENV CONCOURSE_VERSION=7.8.2

RUN apk add --update --no-cache \
    ca-certificates \
    ncurses \
    make \
    git \
    curl \
    jq \
    yq
RUN curl -sL https://github.com/concourse/concourse/releases/download/v${CONCOURSE_VERSION}/fly-${CONCOURSE_VERSION}-linux-amd64.tgz -o /tmp/fly-linux-amd64.tgz && \
    tar -xvzf /tmp/fly-linux-amd64.tgz -C /usr/local/bin && \
    curl -sL https://taskfile.dev/install.sh | sh

FROM resource
ENTRYPOINT [ "fly" ]
CMD ["--help"]