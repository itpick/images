# calico-goldmane

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#calico-goldmane

# Load into Docker
nix build .#load-calico-goldmane-to-docker && ./result/bin/load-calico-goldmane-to-docker
```
