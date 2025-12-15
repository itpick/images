# gnupg-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#gnupg-fips

# Load into Docker
nix build .#load-gnupg-fips-to-docker && ./result/bin/load-gnupg-fips-to-docker
```
