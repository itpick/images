# logstash-8.19-with-output-opensearch

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#logstash-8.19-with-output-opensearch

# Load into Docker
nix build .#load-logstash-8.19-with-output-opensearch-to-docker && ./result/bin/load-logstash-8.19-with-output-opensearch-to-docker
```
