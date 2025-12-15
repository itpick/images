# aws-eks-pod-identity-agent-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#aws-eks-pod-identity-agent-fips

# Load into Docker
nix build .#load-aws-eks-pod-identity-agent-fips-to-docker && ./result/bin/load-aws-eks-pod-identity-agent-fips-to-docker
```
