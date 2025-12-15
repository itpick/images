# cue-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cue-fips

# Load into Docker
nix build .#load-cue-fips-to-docker && ./result/bin/load-cue-fips-to-docker
```
