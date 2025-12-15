# nextcloud-server-fips

Nextcloud server, a safe home for all your data

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nextcloud-server-fips

# Load into Docker
nix build .#load-nextcloud-server-fips-to-docker && ./result/bin/load-nextcloud-server-fips-to-docker
```
