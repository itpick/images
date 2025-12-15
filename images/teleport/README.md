# teleport

Teleport is an access management platform designed to provide secure and unified access to various infrastructure resources such as SSH, Kubernetes clusters, databases, and web applications

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 16s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#teleport

# Load into Docker
nix build .#load-teleport-to-docker && ./result/bin/load-teleport-to-docker
```
