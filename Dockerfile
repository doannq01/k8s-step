version: "3"
services:
  app1:
    image: image:tag
    ports:
      - 8001:80
    networks:
      - client
    logging:
      driver: 'json-file'
      options:
        max-size: '50m'
    networks:
      - client
networks:
  client:
