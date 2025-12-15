# sbt

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 6s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#sbt

# Load into Docker
nix build .#load-sbt-to-docker && ./result/bin/load-sbt-to-docker
```
