ARG TAG=4.2.6

ARG BASE_CONTAINER=neo4j:$TAG

FROM $BASE_CONTAINER

ARG TAG

ENV NEO4J_VERSION=$TAG

#plugins
ENV APOC_VERSIONS_JSON=https://raw.githubusercontent.com/neo4j-contrib/neo4j-apoc-procedures/master/versions.json

ENV GDS_VERSIONS_JSON=https://s3-eu-west-1.amazonaws.com/com.neo4j.graphalgorithms.dist/graph-data-science/versions.json

ENV NEO4J_AUTH=none

#ENV NEO4J_dbms_memory_pagecache_size=2G

#ENV NEO4J_dbms_memory_heap_max__size=10G

ENV NEO4J_HOME /var/lib/neo4j

RUN apt-get update && apt-get install -y \
    curl \
    jq \
 && rm -rf /var/lib/apt/lists/*

COPY install-plugins.sh /install-plugins.sh

RUN chmod +x /install-plugins.sh && /install-plugins.sh

