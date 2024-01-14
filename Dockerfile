FROM alpine:edge as builder

RUN adduser -D j3 && addgroup j3 abuild
RUN apk add --no-cache doas build-base alpine-sdk
RUN apk update
ADD doas.conf /etc/doas.d/j3.conf

USER j3
COPY --chown=j3:j3 . /home/j3
WORKDIR /home/j3/nomad

RUN abuild -r

FROM busybox:stable-musl
RUN adduser -D httpd
USER httpd
WORKDIR /home/httpd

COPY --from=builder /home/j3/.abuild/*.pub .
COPY --from=builder /home/j3/packages/j3 j3

CMD ["busybox", "httpd", "-f", "-v", "-p", "8080"]
