FROM alpine:latest
WORKDIR /mnt

RUN apk add mysql-client

CMD mysqldump -P 3306 -h "${DB_HOST}" -u "${DB_USER}" --password "${DB_PASSWORD}" "${DB_NAME}" > "Backup/Database/$(date +%F).sql"
