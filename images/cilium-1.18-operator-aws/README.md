# cilium-1.18-operator-aws

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cilium-1.18-operator-aws

# Load into Docker
nix build .#load-cilium-1.18-operator-aws-to-docker && ./result/bin/load-cilium-1.18-operator-aws-to-docker
```
