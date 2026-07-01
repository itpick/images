# zookeeper-nixchart

Apache ZooKeeper is an effort to develop and maintain an open-source server which enables highly reliable distributed coordination

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#zookeeper-nixchart

# Load into Docker
nix build .#load-zookeeper-nixchart-to-docker && ./result/bin/load-zookeeper-nixchart-to-docker
```
