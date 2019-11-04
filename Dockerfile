FROM neo4j:latest

ENV NEO4J_PASS neo4j

COPY cngpass.sh /cngpass.sh

RUN chmod +x /cngpass.sh

# adding change password script to the original entrypoint
RUN echo "" >> /docker-entrypoint.sh && echo "/cngpass.sh &" >> /docker-entrypoint.sh
