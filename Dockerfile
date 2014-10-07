FROM ubuntu:precise

MAINTAINER Doug Tangren <d.tangren@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update && apt-get -y upgrade && apt-get -y dist-upgrade

RUN apt-get -y --force-yes \
            install supervisor \
                    openjdk-7-jre-headless \
                    curl

RUN mkdir -p /var/log/supervisor

COPY ./etc/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

COPY ./bin/run /bin/run

RUN export ES_VERSION=1.3.4 && curl --progress-bar \
     "https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-$ES_VERSION.tar.gz" \
     | tar xz && mv "elasticsearch-$ES_VERSION" elasticsearch

RUN mkdir -p /data

COPY ./etc/elasticsearch.yml /data/elasticsearch.yml

EXPOSE 9200 9300 9292

VOLUME /data

CMD /bin/run

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*