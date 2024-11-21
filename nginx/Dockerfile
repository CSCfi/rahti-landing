FROM alpine/openssl:3.3.2 AS ssl_builder

RUN openssl req -nodes -new -x509 -subj "/CN=development" -keyout /tmp/server.key -out /tmp/server.crt

FROM nginx:stable-alpine

RUN mkdir -p /etc/ssl/rahti
COPY --from=ssl_builder /tmp/server.key /etc/ssl/rahti/.
COPY --from=ssl_builder /tmp/server.crt /etc/ssl/rahti/.

COPY nginx.conf /etc/nginx

EXPOSE 443
