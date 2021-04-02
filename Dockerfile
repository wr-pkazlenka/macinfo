# After quick search, this is the lightest base for bash script
FROM alpine:latest

# Proxying $API_KEY env variable inside our container
ARG API_KEY
ENV API_KEY=${API_KEY}

RUN apk add --no-cache bash curl

WORKDIR .
COPY macinfo.sh .

ENTRYPOINT ["./macinfo.sh"] 
