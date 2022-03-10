FROM alpine:3.11.6 as builder

LABEL maintainer="Ztj <ztj1993@gmail.com>"

ARG GITHUB_MIRROR=https://github.com
ARG WEBPROC_VERSION=0.4.0
ARG WEBPROC_URI=${GITHUB_MIRROR}/jpillora/webproc/releases/download/v${WEBPROC_VERSION}
ARG WEBPROC_CHECKSUM="6f805a07aa975d99ff06c7ea3097fa155d5aada1931e947b15a68170b2b00eb0"

ADD ${WEBPROC_URI}/webproc_${WEBPROC_VERSION}_linux_amd64.gz /tmp/webproc.gz

RUN echo "Name: webproc" \
  && echo "Version: ${WEBPROC_VERSION}" \
  && echo "CheckSum: ${WEBPROC_CHECKSUM}" \
  && if [ "${WEBPROC_CHECKSUM}" != "$(sha256sum /tmp/webproc.gz | awk '{print $1}')" ]; then exit 1; fi \
  && gzip -d /tmp/webproc.gz \
  && cp /tmp/webproc /bin/webproc \
  && chmod +x /bin/webproc


FROM alpine:3.11.6

LABEL maintainer="Ztj <ztj1993@gmail.com>"

COPY --from=builder /bin/webproc /bin/webproc

CMD ["webproc"]
