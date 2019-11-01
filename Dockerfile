FROM neo4j

NEO4J_USER neo4j
NEO4j_PASS neo4j

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
