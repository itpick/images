# node-feature-discovery

A minimal wolfi-based image for node-feature-discovery, Node feature discovery for Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#node-feature-discovery

# Load into Docker
nix build .#load-node-feature-discovery-to-docker && ./result/bin/load-node-feature-discovery-to-docker
```
