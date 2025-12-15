# solr Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 8983 |
| Working directory | /usr/share/java/solr |
| Entrypoint | /usr/share/java/solr/docker/scripts/docker-entrypoint.sh |
| CMD | solr-foreground |
| Volumes | - |
| Stop signal | - |
| Environment variables | LOG4J_PROPS=/var/solr/log4j2.xmlPATH=/usr/share/java/solr/bin:/usr/share/java/solr/bin:/usr/share... |
