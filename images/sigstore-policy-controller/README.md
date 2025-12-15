# sigstore-policy-controller

Policy Controller image that is part of the Sigstore stack

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#sigstore-policy-controller

# Load into Docker
nix build .#load-sigstore-policy-controller-to-docker && ./result/bin/load-sigstore-policy-controller-to-docker
```
