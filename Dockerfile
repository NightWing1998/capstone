#hadolint ignore=DL3007
FROM nginx:latest

COPY index.html /usr/share/nginx/html/

EXPOSE 80
