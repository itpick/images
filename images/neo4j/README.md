# neo4j

Neo4J is a graph database that is commonly used in applications that require complex relationships between data. Neo4j supports both a standalone and a cluster deployment of Neo4j on Kubernetes using the Neo4j Helm charts

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 13s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#neo4j

# Load into Docker
nix build .#load-neo4j-to-docker && ./result/bin/load-neo4j-to-docker
```
