# using docker:latest to have corrent system name for uname calls
FROM docker:latest
RUN apk add --no-cache \
         curl \
    && curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /tmp/docker-compose

# Actual image without curl
FROM docker:latest
COPY --from=0 /tmp/docker-compose /usr/local/bin/docker-compose
RUN chown 1000:1000 /usr/local/bin/docker-compose
RUN chmod 0775 /usr/local/bin/docker-compose
