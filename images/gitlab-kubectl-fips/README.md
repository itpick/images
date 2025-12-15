# gitlab-kubectl-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#gitlab-kubectl-fips

# Load into Docker
nix build .#load-gitlab-kubectl-fips-to-docker && ./result/bin/load-gitlab-kubectl-fips-to-docker
```
