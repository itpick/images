# logstash-iamguarded

Logstash dynamically ingests, transforms, and ships your data regardless of format or complexity

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#logstash-iamguarded

# Load into Docker
nix build .#load-logstash-iamguarded-to-docker && ./result/bin/load-logstash-iamguarded-to-docker
```
