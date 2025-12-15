# bouncycastle-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#bouncycastle-fips

# Load into Docker
nix build .#load-bouncycastle-fips-to-docker && ./result/bin/load-bouncycastle-fips-to-docker
```
