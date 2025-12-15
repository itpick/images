# zookeeper-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#zookeeper-fips

# Load into Docker
nix build .#load-zookeeper-fips-to-docker && ./result/bin/load-zookeeper-fips-to-docker
```
