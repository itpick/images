# neo4j Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 7474 |
| Working directory | /var/lib/neo4j |
| Entrypoint | tini -g -- /startup/docker-entrypoint.sh |
| CMD | neo4j |
| Volumes | /data/logs |
| Stop signal | - |
| Environment variables | JAVA_HOME=/opt/java/openjdkNEO4J_EDITION=communityNEO4J_HOME=/var/lib/neo4jPATH=/var/lib/neo4j/bi... |
