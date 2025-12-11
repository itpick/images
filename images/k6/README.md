# k6

Load testing tool for testing APIs, microservices, and websites

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#k6

# Load into Docker
nix build .#load-k6-to-docker && ./result/bin/load-k6-to-docker
```
