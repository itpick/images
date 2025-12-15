# kafbat-ui

Kafbat-UI is an open-source Web UI for managing Apache Kafka clusters

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kafbat-ui

# Load into Docker
nix build .#load-kafbat-ui-to-docker && ./result/bin/load-kafbat-ui-to-docker
```
