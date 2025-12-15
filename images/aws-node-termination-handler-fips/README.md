# aws-node-termination-handler-fips

Gracefully handle EC2 instance shutdown within Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#aws-node-termination-handler-fips

# Load into Docker
nix build .#load-aws-node-termination-handler-fips-to-docker && ./result/bin/load-aws-node-termination-handler-fips-to-docker
```
