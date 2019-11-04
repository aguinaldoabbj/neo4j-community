FROM neo4j:latest

ENV NEO4J_PASS neo4j

COPY cngpass.sh /cngpass.sh

RUN chmod +x /cngpass.sh

#adding password change script to the top of entrypoint script
RUN sed -i '3s/^/\/cngpass.sh\&\n\n/' /docker-entrypoint.sh

