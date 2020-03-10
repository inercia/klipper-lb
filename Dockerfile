FROM alpine:3.8
RUN apk add -U --no-cache iptables curl git
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.16.1/bin/linux/amd64/kubectl && \
    chmod u+x kubectl && mv kubectl /usr/bin/kubectl
COPY entry /usr/bin/
CMD ["entry"]
