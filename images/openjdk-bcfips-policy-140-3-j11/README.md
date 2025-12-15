# openjdk-bcfips-policy-140-3-j11

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#openjdk-bcfips-policy-140-3-j11

# Load into Docker
nix build .#load-openjdk-bcfips-policy-140-3-j11-to-docker && ./result/bin/load-openjdk-bcfips-policy-140-3-j11-to-docker
```
