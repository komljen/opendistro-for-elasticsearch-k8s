FROM amazon/opendistro-for-elasticsearch:0.8.0

RUN rm -rf /usr/share/elasticsearch/plugins/opendistro_security

# Set environment variables defaults
ENV ES_JAVA_OPTS "-Xms512m -Xmx512m"
ENV CLUSTER_NAME elasticsearch-default
ENV NODE_MASTER true
ENV NODE_DATA true
ENV NODE_INGEST true
ENV HTTP_ENABLE true
ENV NETWORK_HOST _site_
ENV HTTP_CORS_ENABLE true
ENV HTTP_CORS_ALLOW_ORIGIN *
ENV NUMBER_OF_MASTERS 1
ENV MAX_LOCAL_STORAGE_NODES 1
ENV SHARD_ALLOCATION_AWARENESS ""
ENV SHARD_ALLOCATION_AWARENESS_ATTR ""
ENV MEMORY_LOCK false
ENV DISCOVERY_SERVICE elasticsearch-discovery
ENV TAKE_FILE_OWNERSHIP yes

ADD config /usr/share/elasticsearch/config
COPY es-entrypoint.sh /usr/local/bin/es-entrypoint.sh

VOLUME ["/data"]

ENTRYPOINT ["/usr/local/bin/es-entrypoint.sh"]
