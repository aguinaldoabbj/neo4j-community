#!/bin/bash -eu

/docker-entrypoint.sh &
sleep 10

# changing default password on lauching container
curl -H 'Content-Type: application/json' -XPOST -d '{"password":$NEO4J_PASS}' -u neo4j:neo4j http://localhost:7474/user/neo4j/password



