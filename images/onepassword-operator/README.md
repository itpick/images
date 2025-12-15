# onepassword-operator

The 1Password Connect Kubernetes Operator provides the ability to integrate Kubernetes Secrets with 1Password

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#onepassword-operator

# Load into Docker
nix build .#load-onepassword-operator-to-docker && ./result/bin/load-onepassword-operator-to-docker
```
