# gpg-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#gpg-fips

# Load into Docker
nix build .#load-gpg-fips-to-docker && ./result/bin/load-gpg-fips-to-docker
```
