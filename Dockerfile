ARG VERSION=3.5.13

ARG BASE_CONTAINER=neo4j:$VERSION

FROM $BASE_CONTAINER

ENV NEO4J_VERSION=3.5.13

ENV APOC_VERSIONS_JSON=https://raw.githubusercontent.com/neo4j-contrib/neo4j-apoc-procedures/master/versions.json

ENV ALGO_VERSIONS_JSON=https://raw.githubusercontent.com/neo4j-contrib/neo4j-graph-algorithms/master/versions.json

ENV NEO4J_PASS neo4j

ENV NEO4J_HOME /var/lib/neo4j

COPY cngpass.sh /cngpass.sh

RUN chmod +x /cngpass.sh

#adding password change script to the top of entrypoint script
RUN sed -i '3s/^/\/cngpass.sh\&\n\n/' /docker-entrypoint.sh

COPY install-plugins.sh /install-plugins.sh

RUN chmod +x /install-plugins.sh && /install-plugins.sh

