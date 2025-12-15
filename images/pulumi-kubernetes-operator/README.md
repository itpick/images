# pulumi-kubernetes-operator

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#pulumi-kubernetes-operator

# Load into Docker
nix build .#load-pulumi-kubernetes-operator-to-docker && ./result/bin/load-pulumi-kubernetes-operator-to-docker
```
