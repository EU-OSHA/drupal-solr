FROM    openjdk:8-jre

RUN apt-get update && \
  apt-get -y install lsof procps wget gpg && \
  rm -rf /var/lib/apt/lists/*

ENV SOLR_USER="solr" \
    SOLR_UID="8983" \
    SOLR_GROUP="solr" \
    SOLR_GID="8983" \
    SOLR_VERSION="4.10.4" \
    SOLR_SHA256="ac3543880f1b591bcaa962d7508b528d7b42e2b5548386197940b704629ae851" \
    PATH="/opt/solr/bin:/opt/docker-solr/scripts:$PATH"

RUN groupadd -r --gid $SOLR_GID $SOLR_GROUP && \
  useradd -r --uid $SOLR_UID --gid $SOLR_GID $SOLR_USER

COPY . /opt/solr

RUN chown -R $SOLR_USER:$SOLR_GROUP /opt/solr

EXPOSE 8983
WORKDIR /opt/solr
USER $SOLR_USER
VOLUME /opt/solr/cores

ENTRYPOINT ["/opt/solr/docker-entrypoint.sh"]