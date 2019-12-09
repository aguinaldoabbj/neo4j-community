#!/bin/bash

sleep 25

# changing default password on lauching container
curl -H 'Content-Type: application/json' -XPOST -d '{"password":"'"$NEO4J_PASS"'"}' -u neo4j:neo4j http://localhost:7474/user/neo4j/password

sleep 25

# changing default password on lauching container
curl -H 'Content-Type: application/json' -XPOST -d '{"password":"'"$NEO4J_PASS"'"}' -u neo4j:neo4j http://localhost:7474/user/neo4j/password


