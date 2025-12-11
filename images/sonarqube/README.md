# sonarqube

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 45s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#sonarqube

# Load into Docker
nix build .#load-sonarqube-to-docker && ./result/bin/load-sonarqube-to-docker
```
