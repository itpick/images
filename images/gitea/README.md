# gitea

A painless self-hosted all-in-one software development service, including Git hosting, code review, team collaboration, package registry and CI/CD

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#gitea

# Load into Docker
nix build .#load-gitea-to-docker && ./result/bin/load-gitea-to-docker
```
