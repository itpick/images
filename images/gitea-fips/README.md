# gitea-fips

A painless self-hosted all-in-one software development service, including Git hosting, code review, team collaboration, package registry and CI/CD

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#gitea-fips

# Load into Docker
nix build .#load-gitea-fips-to-docker && ./result/bin/load-gitea-fips-to-docker
```
