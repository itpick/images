# falcoctl-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#falcoctl-fips

# Load into Docker
nix build .#load-falcoctl-fips-to-docker && ./result/bin/load-falcoctl-fips-to-docker
```
