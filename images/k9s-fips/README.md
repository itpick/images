# k9s-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#k9s-fips

# Load into Docker
nix build .#load-k9s-fips-to-docker && ./result/bin/load-k9s-fips-to-docker
```
