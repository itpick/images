# gpgsm-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#gpgsm-fips

# Load into Docker
nix build .#load-gpgsm-fips-to-docker && ./result/bin/load-gpgsm-fips-to-docker
```
