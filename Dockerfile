FROM nginx

MAINTAINER Sergei Z
LABEL version="1.0" description="Simple Bash HTTP server"	

RUN apt-get update && apt-get install socat git -y && apt-get clean -y && rm -rf /var/lib/apt/lists/*
RUN mkdir /tests
RUN touch /etc/default/socat.conf
RUN git clone https://github.com/kward/shunit2.git 

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
#CMD ["sh", "-c", "/bin/bash"]
