FROM nginx

MAINTAINER Sergei Z
LABEL version="1.0" description="Simple Bash HTTP server"	

RUN apt-get update && apt-get install socat -y && apt-get clean -y && rm -rf /var/lib/apt/lists/*
RUN mkdir /tests
RUN touch /etc/default/socat.conf

#ENV APACHE_RUN_USER www-data
#ENV APACHE_RUN_GROUP www-data
#ENV APACHE_LOG_DIR /var/log/apache2
COPY ./bashttpd /
COPY ./bashttpd.conf /
COPY ./tests/* /tests/
COPY ./socat /
COPY ./socat.conf /etc/default/socat.conf

EXPOSE 8082
#ENTRYPOINT ["/socat"]
CMD ["sh", "-c", "/socat start; bash"]
#CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
