# druid

Apache Druid is a high performance real-time analytics database

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#druid

# Load into Docker
nix build .#load-druid-to-docker && ./result/bin/load-druid-to-docker
```
