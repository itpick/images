# nacos

Dynamic service discovery, configuration and service management platform for building AI cloud native applications

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nacos

# Load into Docker
nix build .#load-nacos-to-docker && ./result/bin/load-nacos-to-docker
```
