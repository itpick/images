# bcfips-policy-140

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#bcfips-policy-140

# Load into Docker
nix build .#load-bcfips-policy-140-to-docker && ./result/bin/load-bcfips-policy-140-to-docker
```
