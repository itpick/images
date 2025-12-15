# kratos

A microservice-oriented governance framework written in Go

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 5s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#kratos

# Load into Docker
nix build .#load-kratos-to-docker && ./result/bin/load-kratos-to-docker
```
