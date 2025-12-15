# logstash-oss-with-opensearch-output-plugin

An image with the Logstash plugin that sends event data to a OpenSearch clusters and stores as an index

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#logstash-oss-with-opensearch-output-plugin

# Load into Docker
nix build .#load-logstash-oss-with-opensearch-output-plugin-to-docker && ./result/bin/load-logstash-oss-with-opensearch-output-plugin-to-docker
```
