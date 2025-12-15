# jenkins

A minimal, Wolfi-based container image for Jenkins - an open-source CI/CD server that enables developers to build, test, and deploy their software

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 12s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#jenkins

# Load into Docker
nix build .#load-jenkins-to-docker && ./result/bin/load-jenkins-to-docker
```
