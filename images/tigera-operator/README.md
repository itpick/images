# tigera-operator

Minimal Project Calico Tigera Operator Image

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tigera-operator

# Load into Docker
nix build .#load-tigera-operator-to-docker && ./result/bin/load-tigera-operator-to-docker
```
