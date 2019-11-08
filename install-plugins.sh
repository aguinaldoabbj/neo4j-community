#!/bin/bash

cd plugins

# download apoc if not yet there. 
# note: we need to follow redirects and want to use orig filename
# gotcha: if you have a non-matching version of apoc, this will *not* fail.
if ! ls apoc-*-all.jar 1> /dev/null 2>&1; then
	# resolve correct apoc version 
	APOC_URL=`curl -s $APOC_VERSIONS_JSON | jq -r ".[] | select (.neo4j == \"$NEO4J_VERSION\") | [.jar] | first"`
	#echo $APOC_URL
	curl -L -C - -O -J "$APOC_URL"

cd ..
