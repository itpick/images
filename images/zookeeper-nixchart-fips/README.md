# zookeeper-nixchart-fips

Apache ZooKeeper is an effort to develop and maintain an open-source server which enables highly reliable distributed coordination

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#zookeeper-nixchart-fips

# Load into Docker
nix build .#load-zookeeper-nixchart-fips-to-docker && ./result/bin/load-zookeeper-nixchart-fips-to-docker
```
