FROM    openjdk:8-jre

RUN apt-get update && \
  apt-get -y install lsof procps wget gpg && \
  rm -rf /var/lib/apt/lists/*

ENV SOLR_USER="solr" \
    SOLR_UID="8983" \
    SOLR_GROUP="solr" \
    SOLR_GID="8983" \
    PATH="/opt/solr/bin:$PATH"

RUN groupadd -r --gid $SOLR_GID $SOLR_GROUP && \
  useradd -r --uid $SOLR_UID --gid $SOLR_GID $SOLR_USER

COPY . /opt/solr

RUN chown -R $SOLR_USER:$SOLR_GROUP /opt/solr

EXPOSE 8983
WORKDIR /opt/solr
USER $SOLR_USER
VOLUME /opt/solr/cores

ENTRYPOINT ["/opt/solr/docker-entrypoint.sh"]
