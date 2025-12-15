# alertmanager-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#alertmanager-fips

# Load into Docker
nix build .#load-alertmanager-fips-to-docker && ./result/bin/load-alertmanager-fips-to-docker
```
