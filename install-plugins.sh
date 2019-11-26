#/bin/bash

cd $NEO4J_HOME/plugins

# download apoc if not yet there. 
# note: we need to follow redirects and want to use orig filename
# gotcha: if you have a non-matching version of apoc, this will *not* fail.

#APOC
if ! ls apoc-*-all.jar 1> /dev/null 2>&1; then
        # resolve correct apoc version 
        APOC_URL=`curl -s $APOC_VERSIONS_JSON | jq -r ".[] | select (.neo4j == \"$NEO4J_VERSION\") | [.jar] | first"`
        curl -L -C - -O -J "$APOC_URL"
fi

#ALGO
if ! ls neo4j-graph-algorithms*.jar 1> /dev/null 2>&1; then
        # resolve correct algo version 
        ALGO_URL=`curl -s $ALGO_VERSIONS_JSON | jq -r ".[] | select (.neo4j == \"$NEO4J_VERSION\") | [.jar] | first"`
        curl -L -C - -O -J "$ALGO_URL"
fi



cd $NEO4J_HOME

echo "dbms.security.procedures.unrestricted=apoc.*" >> $NEO4J_HOME/conf/neo4j.conf
echo "dbms.security.procedures.whitelist=apoc.coll.*,apoc.load.*" >> $NEO4J_HOME/conf/neo4j.conf
echo "dbms.security.procedures.unrestricted=algo.*" >> $NEO4J_HOME/conf/neo4j.conf


