# Use the official Apache HTTP server image as a base
FROM httpd:latest
COPY . /usr/local/apache2/htdocs/
COPY ./index.html /usr/local/apache2/htdocs/index.html
