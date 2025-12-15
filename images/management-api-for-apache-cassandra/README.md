# management-api-for-apache-cassandra

RESTful / Secure Management Sidecar for Apache Cassandra

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#management-api-for-apache-cassandra

# Load into Docker
nix build .#load-management-api-for-apache-cassandra-to-docker && ./result/bin/load-management-api-for-apache-cassandra-to-docker
```
