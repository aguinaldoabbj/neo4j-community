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

#GDP
if ! ls neo4j-graph-data-science*.jar 1> /dev/null 2>&1; then
        # resolve correct GDP version 
        GDS_URL=`curl -s $GDS_VERSIONS_JSON | jq -r ".[] | select (.neo4j == \"$NEO4J_VERSION\") | [.jar] | first"`
        curl -L -C - -O -J "$GDS_URL"
fi

cd $NEO4J_HOME

echo "dbms.security.procedures.unrestricted=apoc.*,gds.*" >> $NEO4J_HOME/conf/neo4j.conf
echo "dbms.security.procedures.whitelist=apoc.*, gds.*" >> $NEO4J_HOME/conf/neo4j.conf


