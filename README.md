# MinIO Backup S3
`minio-backup-s3` is a service giving you ability to mirror entities from `SOURCE OBJECT STORAGE` to `DESTINATION OBJECT STORAGE`.

## Docker compose
```yml
services:
  minio-backup-s3:
    build:
      context: .
      dockerfile: Dockerfile
    container_name: minio-backup-s3
    environment:
      - MC_HOST_SOURCE=https://<Access Key>:<Secret Key>@<YOUR-S3-ENDPOINT>
      - MC_HOST_DESTINATION=https://<Access Key>:<Secret Key>@<YOUR-S3-ENDPOINT>

```

## How to run

```sh
$ docker compose up -d
```
