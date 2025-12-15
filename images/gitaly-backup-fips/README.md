# gitaly-backup-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#gitaly-backup-fips

# Load into Docker
nix build .#load-gitaly-backup-fips-to-docker && ./result/bin/load-gitaly-backup-fips-to-docker
```
