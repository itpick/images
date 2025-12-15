# gitlab-operator

Kubernetes Operator for GitLab Server

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#gitlab-operator

# Load into Docker
nix build .#load-gitlab-operator-to-docker && ./result/bin/load-gitlab-operator-to-docker
```
