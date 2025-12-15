# aws-eks-pod-identity-agent

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#aws-eks-pod-identity-agent

# Load into Docker
nix build .#load-aws-eks-pod-identity-agent-to-docker && ./result/bin/load-aws-eks-pod-identity-agent-to-docker
```
