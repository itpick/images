# restic-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#restic-fips

# Load into Docker
nix build .#load-restic-fips-to-docker && ./result/bin/load-restic-fips-to-docker
```
