FROM ubuntu:trusty
RUN apt-get -y update && apt-get -y install git curl

RUN mkdir -p /var/www/fbctf
WORKDIR /var/www/fbctf
RUN git clone https://github.com/facebook/fbctf .
RUN /var/www/fbctf/extra/provision.sh prod `pwd`

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
