# kafka_exporter-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kafka_exporter-fips

# Load into Docker
nix build .#load-kafka_exporter-fips-to-docker && ./result/bin/load-kafka_exporter-fips-to-docker
```
