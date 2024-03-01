# build a tiny docker image
FROM alpine:latest

RUN mkdir /app

COPY serverApp /app

CMD ["/app/serverApp"] 
