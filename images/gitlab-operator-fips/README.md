# gitlab-operator-fips

Kubernetes Operator for GitLab Server

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#gitlab-operator-fips

# Load into Docker
nix build .#load-gitlab-operator-fips-to-docker && ./result/bin/load-gitlab-operator-fips-to-docker
```
