#!/bin/bash -eu

/bin/bash /docker-entrypoint.sh &
sleep 10

curl -H 'Content-Type: application/json' -XPOST -d '{"password":$NEO4J_PASS}' -u neo4j:neo4j http://localhost:7474/user/neo4j/password



