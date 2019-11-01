FROM neo4j

ENV NEO4J_PASS neo4j

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
