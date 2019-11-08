#FROM neo4j:latest
ENV NEO4J_VERSION=3.5.7
ENV APOC_VERSIONS_JSON=https://raw.githubusercontent.com/neo4j-contrib/neo4j-apoc-procedures/master/versions.json

FROM neo4j:$NEO4J_VERSION

ENV NEO4J_PASS neo4j

COPY cngpass.sh /cngpass.sh

RUN chmod +x /cngpass.sh

#adding password change script to the top of entrypoint script
RUN sed -i '3s/^/\/cngpass.sh\&\n\n/' /docker-entrypoint.sh

COPY install_plugins.sh /install_plugins.sh

RUN chmod +x install_plugins.sh && ./install_plugins.sh
