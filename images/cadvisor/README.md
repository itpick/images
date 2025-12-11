# cadvisor

cAdvisor (Container Advisor) provides container users an understanding of the resource usage and performance characteristics of their running containers

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#cadvisor

# Load into Docker
nix build .#load-cadvisor-to-docker && ./result/bin/load-cadvisor-to-docker
```
