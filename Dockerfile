FROM docker:latest

RUN apk add --no-cache \
         py-pip \
    && pip install docker-compose~=1.23.0
