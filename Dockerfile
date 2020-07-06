FROM alpine:latest
WORKDIR /mnt

RUN apk add mysql-client

CMD mysqldump --verbose --host=${DB_HOST} --user=${DB_USER} -p${DB_PASSWORD} ${DB_NAME} > "Backup/Database/$(date +%F).sql" && ls
