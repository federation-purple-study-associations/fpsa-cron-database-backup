FROM node:lts-alpine3.9
WORKDIR /mnt

ADD script.js ./
ADD package.json ./

RUN apk add mysql-client
RUN npm i

CMD mysqldump --verbose --host=${DB_HOST} --user=${DB_USER} -p${DB_PASSWORD} ${DB_NAME} > "$(date +%F).sql" && node script
