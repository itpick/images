# nri-kafka-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nri-kafka-fips

# Load into Docker
nix build .#load-nri-kafka-fips-to-docker && ./result/bin/load-nri-kafka-fips-to-docker
```
