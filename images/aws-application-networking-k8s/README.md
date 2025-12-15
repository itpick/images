# aws-application-networking-k8s

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#aws-application-networking-k8s

# Load into Docker
nix build .#load-aws-application-networking-k8s-to-docker && ./result/bin/load-aws-application-networking-k8s-to-docker
```
