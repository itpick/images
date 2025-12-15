# zookeeper

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#zookeeper

# Load into Docker
nix build .#load-zookeeper-to-docker && ./result/bin/load-zookeeper-to-docker
```
