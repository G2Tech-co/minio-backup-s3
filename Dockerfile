FROM alpine:latest

LABEL org.opencontainers.image.authors="Arsalan Sefidgar <arsalan.sefidgar@gmail.com>"
LABEL org.opencontainers.image.vendor="G2Tech"
LABEL org.opencontainers.image.title="minio-backup-s3"
LABEL org.opencontainers.image.description="minio-backup-s3 exporter for G2Tech products"
LABEL org.opencontainers.image.source="https://github.com/G2Tech-co/minio-backup-s3"
LABEL org.opencontainers.image.url="https://github.com/G2Tech-co/minio-backup-s3"
LABEL org.opencontainers.image.documentation="https://github.com/G2Tech-co/minio-backup-s3"

ENV MC_HOST_SOURCE **None**
ENV MC_HOST_DESTINATION **None**
ENV SCHEDULE **None**

WORKDIR /scripts

COPY ./run.sh run.sh
COPY ./backup.sh backup.sh

RUN apk update

# install minio mc
RUN apk add wget \
    wget https://dl.min.io/client/mc/release/linux-amd64/mc \
    chmod +x mc

# install go-cron
RUN apk add curl \
    curl -L --insecure https://github.com/odise/go-cron/releases/download/v0.0.7/go-cron-linux.gz | zcat > /usr/local/bin/go-cron \
    chmod u+x /usr/local/bin/go-cron

# cleanup
RUN apk del wget
RUN apk del curl
RUN rm -rf /var/cache/apk/*

CMD ["sh", "run.sh"]
