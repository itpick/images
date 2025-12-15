# bouncycastle-pg-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#bouncycastle-pg-fips

# Load into Docker
nix build .#load-bouncycastle-pg-fips-to-docker && ./result/bin/load-bouncycastle-pg-fips-to-docker
```
