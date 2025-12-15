# aws-network-policy-agent

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#aws-network-policy-agent

# Load into Docker
nix build .#load-aws-network-policy-agent-to-docker && ./result/bin/load-aws-network-policy-agent-to-docker
```
